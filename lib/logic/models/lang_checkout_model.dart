import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class LangCheckoutModel extends ChangeNotifier {
  String _sourceLanguage =
      ContainerExtractor.extract(varsContainer, 'current_source_lang');
  String _targetLanguage =
      ContainerExtractor.extract(varsContainer, 'current_target_lang');

  String get sourceLanguage => _sourceLanguage;
  String get targetLanguage => _targetLanguage;

  set sourceLanguage(String value) {
    if (_sourceLanguage != value) {
      _sourceLanguage = value;
      notifyListeners();
    }
  }

  set targetLanguage(String value) {
    if (_targetLanguage != value) {
      _targetLanguage = value;
      notifyListeners();
    }
  }
}
