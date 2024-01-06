import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_nlp_rgr/logic/models/file_model.dart';
import 'package:provider/provider.dart';

class PdfViewer extends StatefulWidget {
  final String path;
  const PdfViewer({super.key, required this.path});
  @override
  State<PdfViewer> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PdfViewer> with WidgetsBindingObserver {
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<FileModel>(
        builder: (context, value, child) => Stack(
              children: [
                PDFView(
                  filePath: widget.path,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: true,
                  pageSnap: true,
                  defaultPage: currentPage!,
                  fitPolicy: FitPolicy.BOTH,
                  preventLinkNavigation: false,
                  onRender: (_pages) {
                    setState(() {
                      value.pagesNum = _pages!;
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
                    value.controller.complete(pdfViewController);
                    // if (!value.controller.isCompleted) {
                    try {
                      value.controller.complete(pdfViewController);
                    } catch (err) {
                      print(err.toString());
                    }
                  },
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      currentPage = value.currentPage;
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
            ));
  }
}
