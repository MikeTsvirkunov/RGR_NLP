import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/option_segment/source_language_checkout_button.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/option_segment/target_language_checkout_button.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/option_segment/translate_launcher_btn.dart';
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
        SourceLanguageCheckoutButton(availableLanguages: availableLanguages),
        const TranslateLaunchingButton(),
        TargetLanguageCheckoutButton(availableLanguages: availableLanguages)
      ],
    );
  }
}
