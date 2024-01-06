import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_nlp_rgr/app/doc_page/pdf_viewer.dart';

class PdfNavigation extends StatefulWidget {
  final File file;
  final Completer<PDFViewController> controller;
  const PdfNavigation(
      {super.key, required this.controller, required this.file});
  @override
  State<PdfNavigation> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PdfNavigation> with WidgetsBindingObserver {
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffcfdf7),
        body: PdfViewer(
          file: widget.file,
          controller: widget.controller,
        ),
        bottomSheet: Container(
            color: Color(0xfffcfdf7),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.file_open)),
                  Row(
                    children: [
                      FutureBuilder<PDFViewController>(
                        future: widget.controller.future,
                        builder: (context,
                            AsyncSnapshot<PDFViewController> snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(Icons.keyboard_arrow_left_rounded),
                              onPressed: () async {
                                currentPage = max(currentPage! - 1, 0);
                                await snapshot.data!.setPage(currentPage!);
                              },
                            );
                          }

                          return Container();
                        },
                      ),
                      FutureBuilder<PDFViewController>(
                        future: widget.controller.future,
                        builder: (context,
                            AsyncSnapshot<PDFViewController> snapshot) {
                          if (snapshot.hasData) {
                            return IconButton(
                              icon: Icon(Icons.keyboard_arrow_right_rounded),
                              onPressed: () async {
                                currentPage = min(currentPage! + 1, 100);
                                await snapshot.data!.setPage(currentPage!);
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ])));
  }
}
