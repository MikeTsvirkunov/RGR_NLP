import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
import 'package:provider/provider.dart';

class ExchangeLanguageButton extends StatefulWidget {
  const ExchangeLanguageButton({super.key});
  @override
  State<ExchangeLanguageButton> createState() =>
      _TranslateLaunchingButtonState();
}

class _TranslateLaunchingButtonState extends State<ExchangeLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<LangCheckoutModel, TranslateModel>(
        builder: (context, langCheckModel, transModel, item) => IconButton(
            padding: EdgeInsets.all(10),
            style: ContainerExtractor.extract(
                decorationsContainer, 'navigation_button.style'),
            onPressed: () {
              var t = langCheckModel.targetLanguage;
              langCheckModel.targetLanguage = langCheckModel.sourceLanguage;
              langCheckModel.sourceLanguage = t;
            },
            icon: const Icon(Icons.swap_horiz_rounded)));
  }
}
