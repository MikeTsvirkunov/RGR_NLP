import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_nlp_rgr/app/doc_page/pdf_navigation.dart';
import 'package:mobile_nlp_rgr/app/doc_page/pdf_viewer.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/file_model.dart';
import 'package:mobile_nlp_rgr/logic/values/models_container.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';

class DocPage extends StatefulWidget {
  const DocPage({super.key});
  @override
  State<DocPage> createState() => _InputTranslatePageState();
}

class _InputTranslatePageState extends State<DocPage> {
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: ContainerExtractor.extract<FileModel>(
            modelsContainer, 'file_model'),
        child: Consumer<FileModel>(builder: (context, value, child) {
          if (value.path == "") {
            FutureBuilder(
                future: value.getFilePath(),
                builder: (context, snapshot) =>
                    Provider<Completer<PDFViewController>>(
                        create: (_) => Completer<PDFViewController>(),
                        child: PdfNavigation()));
            if (value.path == "") {
              return TextButton(
                child: Text('OpenFile'),
                onPressed: () {
                  setState(() {
                    value.getFilePath();
                  });
                  print(value.path);
                },
              );
            }
            return Provider<Completer<PDFViewController>>(
                create: (_) => Completer<PDFViewController>(),
                child: PdfNavigation());
          }
          return Provider<Completer<PDFViewController>>(
              create: (_) => Completer<PDFViewController>(),
              child: PdfNavigation());
        }));
  }
}
