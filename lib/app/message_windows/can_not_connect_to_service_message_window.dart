import 'package:flutter/material.dart';

class CanNotConnectToOurServicesMessageWindow extends StatelessWidget {
  const CanNotConnectToOurServicesMessageWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Our services are not available'),
      content: const Text(
          'Sorry our services is not available now. Pleace try later'),
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
