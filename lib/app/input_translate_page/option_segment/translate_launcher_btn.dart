import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translation_model.dart';
import 'package:mobile_nlp_rgr/logic/values/getters_container.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';
import 'package:provider/provider.dart';

class TranslateLaunchingButton extends StatefulWidget {
  const TranslateLaunchingButton({super.key});
  @override
  State<TranslateLaunchingButton> createState() =>
      _TranslateLaunchingButtonState();
}

class _TranslateLaunchingButtonState extends State<TranslateLaunchingButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LangCheckoutModel, TranslateModel>(
        builder: (context, langCheckModel, transModel, item) => TextButton(
            onPressed: () async {
              Map<String, String> pairsLangsTags =
                  ContainerExtractor.extract(varsContainer, 'langs_tags_pairs');
              var args = ConstantContainer({
                'target_lang_tag':
                    pairsLangsTags[langCheckModel.targetLanguage],
                'source_lang_tag':
                    pairsLangsTags[langCheckModel.sourceLanguage],
                'phrase': transModel.sourceLanguagePhrase
              });
              var res = await ContainerExtractor.extract<IStrategy>(
                      gettersContainer, 'GetTranslationRequest')
                  .execute<Future<Response>>(args);
              transModel.targetLanguagePhrase =
                  json.decode(res.body)['target_lang_phrase'];
              // json.decode(res.body)['target_lang_phrase'];
            },
            child: const Text('Translate')));
  }
}
