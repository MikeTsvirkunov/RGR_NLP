import 'dart:convert';

import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class GetTranslationRequest extends IStrategy {
  @override
  T execute<T>(IExtractable args) {
    String serviceUrl =
        ContainerExtractor.extract(varsContainer, 'service_url');
    String translateWay =
        ContainerExtractor.extract(varsContainer, 'translate_way');
    String phrase = ContainerExtractor.extract(args, 'phrase');
    String targetLangTag = ContainerExtractor.extract(args, 'target_lang_tag');
    String sourceLangTag = ContainerExtractor.extract(args, 'source_lang_tag');
    var url = Uri.https(serviceUrl, translateWay, {
      'source_lang_tag': sourceLangTag,
      'target_lang_tag': targetLangTag,
      'phrase': phrase
    });
    // var response = http.post(url, body: json.encode({'source_lang_phrase': phrase}));
    var response = http.post(url);
    return response as T;
  }
}
