import 'package:mobile_nlp_rgr/logic/interfaces/interface_extendable.dart';

/// Class values for extend container
class ContainerExtender{
  /// set object [value] to extendable [container] on [key]
  static void extend(IExtendable container, Object key, dynamic value) {
    container.extend(key, value);
  }
}