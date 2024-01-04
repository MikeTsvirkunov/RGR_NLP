import 'package:mobile_nlp_rgr/app/input_translate_page/language_item.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_strategy.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class GetCurrentLanguage extends IStrategy{
  @override
  T execute<T>(IExtractable args) {
    return ContainerExtractor.extract(varsContainer, 'current_target_lang') as T;
  }
}