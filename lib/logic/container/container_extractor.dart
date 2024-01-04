import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';

/// Class values for extract from container
class ContainerExtractor{
  /// extract object from extractable [container] by [key]
  static T extract<T>(IExtractable container, Object key) {
    return container.extract(key)  as T;
  }
}