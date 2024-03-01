import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/doc_page/translation_element.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';
import 'package:provider/provider.dart';

class TranslatePanel extends StatefulWidget {
  const TranslatePanel({super.key});
  @override
  State<TranslatePanel> createState() => _InputTranslatePageState();
}

class _InputTranslatePageState extends State<TranslatePanel> {
  @override
  Widget build(BuildContext context) {
    var data = ContainerExtractor.extract<Map<String, String>>(
        varsContainer, 'current_doc.saved_translations');
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Container(
              child: Center(
            child: Container(
              width: 20,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          )),
        ),
        body: ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            // Key('translate_$index') data.keys.elementAt(index) data[data.keys.elementAt(index)]!
            itemBuilder: (context, index) => TranslationElement(
                  key: Key('translate_$index'),
                  targetPhrase: data[data.keys.elementAt(index)]!,
                  sourcePhrase: data.keys.elementAt(index),
                )));
  }
}
