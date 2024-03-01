import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';
import 'package:mobile_nlp_rgr/logic/models/file_model.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';

ConstantContainer modelsContainer = ConstantContainer({
  'file_model': FileModel(),
  'lang_checkout_model': LangCheckoutModel(),
  'translation_model': TranslateModel()
});
