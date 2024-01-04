import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/models/translation_model.dart';
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
              maxLines: 10,
              onChanged: (value) {
                model.sourceLanguagePhrase = value;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              keyboardType: TextInputType.multiline,
            ));
  }
}
