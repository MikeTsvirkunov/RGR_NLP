import 'package:mobile_nlp_rgr/logic/container/default_container.dart';

DefaultContainer varsContainer = DefaultContainer({
  'main_doc_viewer.is_file_ready_to_open': false,
  'main_doc_viewer.current_page': 0,
  'main_doc_viewer.pages_num': 0,
  'main_doc_viewer.is_file_checked': false,
  'service_url': 'charming-secondly-drake.ngrok-free.app',
  'translate_way': 'translate',
  'current_target_lang_phrase': '',
  'current_source_lang_phrase': '',
  'current_target_lang': 'english',
  'current_source_lang': 'russian',
  'langs_tags_pairs': {'russian': 'ru_RU', 'english': 'en_XX'},
  'available_languages': ['russian', 'english', 'german'],
  'current_doc.saved_translations': <String, String>{}
});
