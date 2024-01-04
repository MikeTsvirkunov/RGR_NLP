import 'package:flutter/material.dart';
import 'package:mobile_nlp_rgr/app/input_translate_page/input_translate_page.dart';
import 'package:mobile_nlp_rgr/logic/container/constant_container.dart';


/// Container with common widgets
ConstantContainer widgetsContainer = ConstantContainer(
  {
    'main_pages_list': [const InputTranslatePage(), const Text('b')],
    'main_tabs_list': [const Tab(icon: Icon(Icons.translate),), const Tab(icon: Icon(Icons.document_scanner),)],
  }
);