import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/values/getters_container.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class TranslationModel extends ChangeNotifier {
  String _sourceLanguagePhrase =
      ContainerExtractor.extract(varsContainer, 'current_source_lang_phrase');
  String _targetLanguagePhrase =
      ContainerExtractor.extract(varsContainer, 'current_target_lang_phrase');
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

  void translate() async {
    Map<String, String> pairsLangsTags =
        ContainerExtractor.extract(varsContainer, 'langs_tags_pairs');
    var args = ConstantContainer({
      'target_lang_tag': pairsLangsTags[_targetLanguage],
      'source_lang_tag': pairsLangsTags[_sourceLanguage],
      'phrase': _sourceLanguagePhrase
    });
    var res = await ContainerExtractor.extract<IStrategy>(
            gettersContainer, 'GetTranslationRequest')
        .execute<Future<Response>>(args);
    _targetLanguagePhrase = json.decode(res.body)['target_lang_phrase'];
    notifyListeners();
  }
}
