import 'package:flutter/material.dart';
import 'package:Patient_App/dashboard.dart';

class SurveyCompletePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Survey is Complete',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 10),

          //Text
          Text(
            '수고하셨습니다',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text

          SizedBox(height: 10),

          TextButton(
            child: Text(
              'Back to Dashboard?',
            ), //Text
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
