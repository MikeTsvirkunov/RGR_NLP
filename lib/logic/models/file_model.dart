import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class FileModel extends ChangeNotifier {
  bool isOpen = true;
  late File openedFile;
  String path = '';
  int currentPage = 0;
  int pagesNum = 0;
  var controller = Completer<PDFViewController>();

  Future<String> getFilePath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    path = result != null ? result.files.single.path! : path;
    return path;
  }

  Future<File> openFileByUser() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File file = File(result!.files.single.path!);
    openedFile = file;
    isOpen = true;
    return file;
  }
}
