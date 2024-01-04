import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';

abstract class IStrategy{
  T execute<T>(IExtractable args);
}