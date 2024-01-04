import ioc


def stdTranslate(
    phrase: str,
    source_lang_tag: str,
    target_lang_tag: str
):
    tokenizer = ioc.require('tokenizer_model')
    model = ioc.require('translation_model')
    tokenizer.src_lang = source_lang_tag
    encoded_phrase = tokenizer(phrase, return_tensors="pt")
    generated_tokens = model.generate(
        **encoded_phrase,
        forced_bos_token_id=tokenizer.lang_code_to_id[target_lang_tag]
    )
    return tokenizer.batch_decode(generated_tokens, skip_special_tokens=True)
