import 'package:Patient_App/MoodPage.dart';
import 'package:Patient_App/SurveyPage.dart';
import 'package:Patient_App/util/music_player.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
