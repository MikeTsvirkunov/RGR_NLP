import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/navigation_page.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/themes_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NLP RGR',
      theme: ContainerExtractor.extract(themeContainer, 'main_theme'),
      home: const NavigationPage()
    );
  }
}
