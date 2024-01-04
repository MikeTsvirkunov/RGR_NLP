import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final String language;
  const LanguageItem({super.key, required this.language});
  @override
  Widget build(BuildContext context) {
    return Text(language);
  }
}
