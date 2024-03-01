import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extender.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/translate_model.dart';
import 'package:mobile_nlp_rgr/logic/values/decorations_container.dart';
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
            // padding: EdgeInsets.all(10),
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary)),
            child: Scrollbar(
              radius: const Radius.circular(10),
              child: ShaderMask(
                shaderCallback: (bounds) =>
                    ContainerExtractor.extract<LinearGradient>(
                            decorationsContainer, 'OutputBlock.ShaderMask.Mask')
                        .createShader(bounds),
                blendMode: BlendMode.dstOut,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      model.targetLanguagePhrase,
                      softWrap: true,
                    )),
              ),
            )));
  }
}
