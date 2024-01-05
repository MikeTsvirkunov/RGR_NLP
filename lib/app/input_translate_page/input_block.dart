import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/translation_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
import 'package:provider/provider.dart';

class InputBlock extends StatefulWidget {
  const InputBlock({super.key});
  @override
  State<InputBlock> createState() => _InputTranslatePageState();
}

class _InputTranslatePageState extends State<InputBlock> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateModel>(
        builder: (context, model, item) => TextField(
              maxLines: double.maxFinite.toInt(),
              onChanged: (value) {
                model.sourceLanguagePhrase = value;
              },
              decoration: ContainerExtractor.extract(
                  decorationsContainer, 'InputBlock.TextFieldDecoration'),
              keyboardType: TextInputType.multiline,
            ));
  }
}
