import 'package:flutter/material.dart';

class WiFiTurnedOffMessageWindow extends StatelessWidget {
  const WiFiTurnedOffMessageWindow({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Turn on WiFi'),
      content: const Text('Please turn on wi-fi to connect to our services'),
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
