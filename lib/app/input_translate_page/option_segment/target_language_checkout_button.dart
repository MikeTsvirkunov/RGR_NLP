import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/values/generators_container.dart';
import 'package:provider/provider.dart';

class TargetLanguageCheckoutButton extends StatefulWidget {
  final List<String> availableLanguages;
  const TargetLanguageCheckoutButton(
      {super.key, required this.availableLanguages});
  @override
  State<TargetLanguageCheckoutButton> createState() =>
      _TargetLanguageCheckoutButtonState();
}

class _TargetLanguageCheckoutButtonState
    extends State<TargetLanguageCheckoutButton> {
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
            value: model.targetLanguage,
            items: items,
            onChanged: (value) {
              model.targetLanguage = value;
            }));
  }
}
