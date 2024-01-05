import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/option_segment/language_item.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';

class AvailableLanguagesWidgetsByStringGenerator extends IStrategy {
  @override
  T execute<T>(IExtractable args) {
    List<String> availableLanguages =
        ContainerExtractor.extract(args, 'available_languages');
    return List.generate(
        availableLanguages.length,
        (index) => DropdownMenuItem(
            value: availableLanguages[index],
            child: LanguageItem(language: availableLanguages[index]))) as T;
  }
}
