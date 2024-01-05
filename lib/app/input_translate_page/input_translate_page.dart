import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/input_block.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/option_segment/options_segment.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/output_block.dart';
import 'package:mobile_nlp_rgr/logic/models/lang_checkout_model.dart';
import 'package:mobile_nlp_rgr/logic/models/translation_model.dart';
import 'package:provider/provider.dart';

class InputTranslatePage extends StatefulWidget {
  const InputTranslatePage({super.key});
  @override
  State<InputTranslatePage> createState() => _InputTranslatePageState();
}

class _InputTranslatePageState extends State<InputTranslatePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LangCheckoutModel>(
              create: (_) => LangCheckoutModel()),
          ChangeNotifierProvider<TranslateModel>(
              create: (_) => TranslateModel()),
        ],
        child: Flex(
          direction: Axis.vertical,
          children: [
            Consumer<LangCheckoutModel>(
              builder: (context, model, child) => Text(model.targetLanguage),
            ),
            const Flexible(flex: 1, fit: FlexFit.tight, child: InputBlock()),
            const Padding(padding: EdgeInsets.all(10), child: OptionSegment()),
            Consumer<LangCheckoutModel>(
              builder: (context, model, child) => Text(model.sourceLanguage),
            ),
            const Flexible(flex: 1, fit: FlexFit.tight, child: OutputBlock()),
          ],
        ));
  }
}
