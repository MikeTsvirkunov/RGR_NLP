from fastapi import FastAPI
from transformers import MBartForConditionalGeneration, AutoTokenizer
# from .code.translate_functions import stdTranslate
# from .code.initiation import stdInitiatior
import ioc
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder
import logging, logging.config
import torch


logger = logging.getLogger("gunicorn.error")

class SourcePhrase(BaseModel):
    source_lang_phrase: str


def stdTranslate(
    phrase: str,
    source_lang_tag: str,
    target_lang_tag: str
):
    with torch.no_grad():
        device = str(ioc.require('device'))
        tokenizer = ioc.require('tokenizer_model')
        model = ioc.require('translation_model')
        tokenizer.src_lang = source_lang_tag
        encoded_phrase = tokenizer(phrase, return_tensors="pt")
        
        for i in encoded_phrase:
            encoded_phrase[i] = encoded_phrase[i].to(device)

        generated_tokens = model.generate(
            **encoded_phrase,
            forced_bos_token_id=tokenizer.lang_code_to_id[target_lang_tag]
        )
        res = tokenizer.batch_decode(generated_tokens, skip_special_tokens=True)
    return res


def initiation():
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model = MBartForConditionalGeneration.from_pretrained("facebook/mbart-large-50-many-to-many-mmt").to(device)
    tokenizer = AutoTokenizer.from_pretrained("facebook/mbart-large-50-many-to-many-mmt", use_fast=False)
    ioc.provide('translation_model', model)
    ioc.provide('device', device)
    ioc.provide('tokenizer_model', tokenizer)
    ioc.provide('translate_function', stdTranslate)



initiation()
app = FastAPI()



@app.post("/translate")
async def translateRoot(
    phrase: str,
    source_lang_tag: str,
    target_lang_tag: str,
):
    '''
        Example data:
        - source_lang_tag: ru_RU
        - target_lang_tag: en_XX
        - phrase: По аналогии с рекуррентными нейронными сетями
    '''
    # logging.warning(f"{phrase}")
    # source_lang_phrase = jsonable_encoder(phrase)['source_lang_phrase']
    source_lang_phrase = phrase
    logging.warning(f"Get phrase:\t{source_lang_phrase}")
    target_lang_phrase = ioc.require('translate_function')(phrase=source_lang_phrase, source_lang_tag=source_lang_tag, target_lang_tag=target_lang_tag)
    return {
        "source_lang_phrase": source_lang_phrase,
        "target_lang_phrase": target_lang_phrase[0]
    }
