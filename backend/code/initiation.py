from transformers import MBartForConditionalGeneration, AutoTokenizer
from code.translate_functions import translate
import ioc


def initiation():
    model = MBartForConditionalGeneration.from_pretrained("facebook/mbart-large-50-many-to-many-mmt")
    tokenizer = AutoTokenizer.from_pretrained("facebook/mbart-large-50-many-to-many-mmt", use_fast=False)
    ioc.provide('translation_model', model)
    ioc.provide('tokenizer_model', tokenizer)
    ioc.provide('translate_function', translate)
