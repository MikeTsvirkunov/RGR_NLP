import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class TranslationElement extends StatelessWidget {
  final String targetPhrase;
  final String sourcePhrase;
  const TranslationElement({
    required super.key,
    required this.targetPhrase,
    required this.sourcePhrase,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) {
        ContainerExtractor.extract<Map<String, String>>(
                varsContainer, 'current_doc.saved_translations')
            .removeWhere((key, value) => key == sourcePhrase);
      },
      key: key!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(10), child: Text(targetPhrase)),
          Padding(padding: EdgeInsets.all(10), child: Text(sourcePhrase))
        ],
      ),
    );
  }
}
