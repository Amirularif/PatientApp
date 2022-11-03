import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final void Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white70, onPrimary: Colors.black87
        ),
        onPressed: selectHandler,
        child: Text(answerText,
            style: TextStyle(
            color: Colors.black87
        )
        ),
        /*color: Colors.amber.shade200,
        textColor: Colors.black87,
        child: Text(answerText),
        onPressed: selectHandler,*/
      ),
    );
  }
}
