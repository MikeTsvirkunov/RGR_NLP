import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/models/translation_model.dart';
import 'package:provider/provider.dart';

class OutputBlock extends StatefulWidget {
  const OutputBlock({super.key});
  @override
  State<OutputBlock> createState() => _OutputBlockState();
}

class _OutputBlockState extends State<OutputBlock> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateModel>(
        builder: (context, model, item) => Container(
              child: Text(model.targetLanguagePhrase),
            ));
  }
}
