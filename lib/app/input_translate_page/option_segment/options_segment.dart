import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/language_checkout_button.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class OptionSegment extends StatefulWidget {
  const OptionSegment({super.key});
  @override
  State<OptionSegment> createState() => _OptionSegmentState();
}

class _OptionSegmentState extends State<OptionSegment> {
  @override
  Widget build(BuildContext context) {
    List<String> availableLanguages =
        ContainerExtractor.extract(varsContainer, 'available_languages');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LanguageCheckoutButton(
            availableLanguages: availableLanguages, isTarget: true),
        LanguageCheckoutButton(
            availableLanguages: availableLanguages, isTarget: false)
      ],
    );
  }
}
