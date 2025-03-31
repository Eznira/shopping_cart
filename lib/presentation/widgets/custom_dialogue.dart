import 'package:flutter/material.dart';

class CustomDialogue extends StatelessWidget {
  final String title;
  final String content;

  const CustomDialogue({Key? key, required this.title, required this.content})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("OK"),
        ),
      ],
    );
  }
}
