import 'package:flutter/material.dart';

class FileDoesNotOpenMessageWindow extends StatelessWidget {
  const FileDoesNotOpenMessageWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select a document'),
      content: const Text(
          'Please open document on right tab page, to save current translations'),
      actionsPadding: const EdgeInsets.all(10),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'))
      ],
    );
  }
}
