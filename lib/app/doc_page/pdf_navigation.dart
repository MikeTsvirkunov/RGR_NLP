import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mobile_nlp_rgr/app/doc_page/pdf_viewer.dart';
import 'package:mobile_nlp_rgr/logic/models/file_model.dart';
import 'package:provider/provider.dart';

class PdfNavigation extends StatefulWidget {
  // final String path;
  const PdfNavigation({super.key});
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
    return Consumer<FileModel>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Color(0xfffcfdf7),
            body: PdfViewer(
              path: value.path,
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
                            future: value.controller.future,
                            builder: (context,
                                AsyncSnapshot<PDFViewController> snapshot) {
                              if (snapshot.hasData) {
                                return IconButton(
                                  icon: Icon(Icons.keyboard_arrow_left_rounded),
                                  onPressed: () async {
                                    value.currentPage =
                                        max(value.currentPage - 1, 0);
                                    await snapshot.data!
                                        .setPage(max(currentPage! - 1, 0));
                                  },
                                );
                              }

                              return Container();
                            },
                          ),
                          FutureBuilder<PDFViewController>(
                            future: value.controller.future,
                            builder: (context,
                                AsyncSnapshot<PDFViewController> snapshot) {
                              if (snapshot.hasData) {
                                return IconButton(
                                  icon:
                                      Icon(Icons.keyboard_arrow_right_rounded),
                                  onPressed: () async {
                                    value.currentPage = min(
                                        value.currentPage + 1, value.pagesNum);
                                    await snapshot.data!.setPage(min(
                                        value.currentPage + 1, value.pagesNum));
                                  },
                                );
                              }
                              return Container();
                            },
                          ),
                        ],
                      ),
                    ]))));
  }
}
