import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_nlp_rgr/app/message_windows/file_does_not_exist_message_window.dart';
import 'dart:convert';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extender.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
import 'package:mobile_nlp_rgr/logic/values/getters_container.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';
import 'package:provider/provider.dart';

class SaveTranslateButton extends StatefulWidget {
  const SaveTranslateButton({super.key});
  @override
  State<SaveTranslateButton> createState() => _TranslateLaunchingButtonState();
}

class _TranslateLaunchingButtonState extends State<SaveTranslateButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LangCheckoutModel, TranslateModel>(
        builder: (context, langCheckModel, transModel, item) => IconButton(
            padding: EdgeInsets.all(10),
            style: ContainerExtractor.extract(
                decorationsContainer, 'navigation_button.style'),
            onPressed: () {
              if (ContainerExtractor.extract(
                  varsContainer, 'main_doc_viewer.is_file_ready_to_open')) {
                Map<String, String> translations = ContainerExtractor.extract(
                    varsContainer, 'current_doc.saved_translations');
                translations[transModel.sourceLanguagePhrase] =
                    transModel.targetLanguagePhrase;
                ContainerExtender.extend(varsContainer,
                    'current_doc.saved_translations', translations);
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const FileDoesNotOpenMessageWindow();
                  },
                );
              }
            },
            icon: const Icon(Icons.save_rounded)));
  }
}
