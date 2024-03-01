import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_nlp_rgr/app/message_windows/can_not_connect_to_service_message_window.dart';
import 'package:mobile_nlp_rgr/app/message_windows/wifi_turned_off_message_window.dart';
import 'dart:convert';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
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
        builder: (context, langCheckModel, transModel, item) => IconButton(
            padding: EdgeInsets.all(10),
            style: ContainerExtractor.extract(
                decorationsContainer, 'navigation_button.style'),
            onPressed: () async {
              try {
                Map<String, String> pairsLangsTags = ContainerExtractor.extract(
                    varsContainer, 'langs_tags_pairs');
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
                transModel.targetLanguagePhrase = json
                    .decode(utf8.decode(res.bodyBytes))['target_lang_phrase'];
              } catch (err) {
                var res = err is SocketException;
                if (res) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WiFiTurnedOffMessageWindow();
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const CanNotConnectToOurServicesMessageWindow();
                    },
                  );
                }
              }
            },
            icon: const Icon(Icons.translate_rounded)));
  }
}
