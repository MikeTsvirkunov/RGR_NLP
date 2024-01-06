import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extender.dart';
import 'package:mobile_nlp_rgr/logic/container/container_extractor.dart';
import 'package:mobile_nlp_rgr/logic/values/vars_container.dart';

class PdfViewer extends StatefulWidget {
  final File file;
  final Completer<PDFViewController> controller;
  const PdfViewer({super.key, required this.file, required this.controller});
  @override
  State<PdfViewer> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PdfViewer> with WidgetsBindingObserver {
  int? pages =
      ContainerExtractor.extract(varsContainer, 'main_doc_viewer.pages_num');
  int? currentPage =
      ContainerExtractor.extract(varsContainer, 'main_doc_viewer.current_page');
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PDFView(
          filePath: widget.file.path,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          pageSnap: true,
          defaultPage: currentPage!,
          fitPolicy: FitPolicy.BOTH,
          preventLinkNavigation: false,
          onRender: (pages) {
            setState(() {
              pages = pages!;
              isReady = true;
            });
          },
          onError: (error) {
            setState(() {
              errorMessage = error.toString();
            });
          },
          onPageError: (page, error) {
            setState(() {
              errorMessage = '$page: ${error.toString()}';
            });
          },
          onViewCreated: (PDFViewController pdfViewController) {
            widget.controller.complete(pdfViewController);
          },
          onPageChanged: (int? page, int? total) {
            ContainerExtender.extend(
                varsContainer, 'main_doc_viewer.current_page', page);
            setState(() {
              currentPage = page;
            });
          },
        ),
        errorMessage.isEmpty
            ? !isReady
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container()
            : Center(
                child: Text(errorMessage),
              )
      ],
    );
  }
}
