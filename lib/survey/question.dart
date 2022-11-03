import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.start,
      ), //Text
    ); //Container
  }
}
