import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class TranslateModel extends ChangeNotifier {
  String _sourceLanguagePhrase =
      ContainerExtractor.extract(varsContainer, 'current_source_lang_phrase');
  String _targetLanguagePhrase =
      ContainerExtractor.extract(varsContainer, 'current_target_lang_phrase');

  String get sourceLanguagePhrase => _sourceLanguagePhrase;
  String get targetLanguagePhrase => _targetLanguagePhrase;

  set sourceLanguagePhrase(String value) {
    if (_sourceLanguagePhrase != value) {
      _sourceLanguagePhrase = value;
      notifyListeners();
    }
  }

  set targetLanguagePhrase(String value) {
    if (_targetLanguagePhrase != value) {
      _targetLanguagePhrase = value;
      notifyListeners();
    }
  }
}
