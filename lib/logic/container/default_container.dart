import 'package:mobile_nlp_rgr/logic/interfaces/interface_extendable.dart';
import 'package:mobile_nlp_rgr/logic/interfaces/interface_extractable.dart';

class DefaultContainer implements IExtendable, IExtractable{
  late Map _container = {};

  DefaultContainer(Map container){
    _container = container;
  }

  @override
  void extend(Object key, Object value){
    _container[key] = value;
  }

  @override
  T extract<T>(Object key) {
    return _container[key];
  }

}