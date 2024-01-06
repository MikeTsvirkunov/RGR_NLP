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
import 'package:mobile_nlp_rgr/logic/container/container_extender.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/models/file_model.dart';
import 'package:mobile_nlp_rgr/logic/values/models_container.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';
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
  var _controller = Completer<PDFViewController>();
  late Future<File> currentFile;
  int? pages = 0;
  int? currentPage = 0;
  bool isChecked = false;
  bool isReady = false;
  late File currentOpendFile;
  String errorMessage = '';

  Future<File> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    return File(result!.files.single.path!);
  }

  @override
  Widget build(BuildContext context) {
    if (ContainerExtractor.extract(
        varsContainer, 'main_doc_viewer.is_file_ready_to_open')) {
      return PdfNavigation(
        file: ContainerExtractor.extract(varsContainer, 'main_doc_viewer.file'),
        controller: _controller,
      );
    } else if (ContainerExtractor.extract(
        varsContainer, 'main_doc_viewer.is_file_checked')) {
      return FutureBuilder(
        future: currentFile,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            isReady = true;
            ContainerExtender.extend(
                varsContainer, 'main_doc_viewer.is_file_ready_to_open', true);
            ContainerExtender.extend(
                varsContainer, 'main_doc_viewer.file', snapshot.data!);
            return PdfNavigation(
              file: snapshot.data!,
              controller: _controller,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }
    return TextButton(
        onPressed: () async {
          currentFile = getFile();
          isChecked = true;

          ContainerExtender.extend(
              varsContainer, 'main_doc_viewer.is_file_checked', true);
          setState(() {});
        },
        child: Text('open'));
  }
}
