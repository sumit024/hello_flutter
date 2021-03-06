import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question(this.question, {Key? key}) : super(key: key);

  final String? question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          question!,
          style: const TextStyle(fontSize: 20, color: Colors.redAccent),
          textAlign: TextAlign.center,
        ));
  }
}
