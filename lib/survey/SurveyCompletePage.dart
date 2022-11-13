import 'package:flutter/material.dart';
import 'package:Patient_App/dashboard.dart';
import 'package:intl/intl.dart';
import '../server/SurveyData.dart';

class SurveyCompletePage extends StatelessWidget {
  String recdate = DateFormat('dd/MM/yyyy').format(DateTime.now());

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
              SurveyData.addSurvey("P1001", recdate);
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
