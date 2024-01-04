import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/values/generators_container.dart';
import 'package:provider/provider.dart';

class LanguageCheckoutButton extends StatefulWidget {
  final bool isTarget;
  final List<String> availableLanguages;
  const LanguageCheckoutButton(
      {super.key, required this.availableLanguages, required this.isTarget});
  @override
  State<LanguageCheckoutButton> createState() => _LanguageCheckoutButtonState();
}

class _LanguageCheckoutButtonState extends State<LanguageCheckoutButton> {
  late String currentLanguage;
  @override
  Widget build(BuildContext context) {
    var items = ContainerExtractor.extract<IStrategy>(generatorsContainer,
            'LanguageCheckoutButton.AvailableLanguagesWidgetsByStringGenerator')
        .execute<List<DropdownMenuItem>>(ConstantContainer(
            {'available_languages': widget.availableLanguages}));
    return Consumer<LangCheckoutModel>(
        builder: (context, model, child) => DropdownButton(
            underline: const SizedBox(height: 0),
            value:
                widget.isTarget ? model.targetLanguage : model.sourceLanguage,
            items: items,
            onChanged: (value) {
              if (widget.isTarget) {
                model.targetLanguage = value;
              } else {
                model.sourceLanguage = value;
              }
            }));
  }
}
