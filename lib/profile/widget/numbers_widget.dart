import 'package:flutter/material.dart';
import 'package:Patient_App/profile/edit_profile_page.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';

import '../../server/ProfileData.dart';

class NumbersWidget extends StatefulWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  State<NumbersWidget> createState() => _NumbersWidgetState();
}

class _NumbersWidgetState extends State<NumbersWidget> {
  User? userProf;
  Future DBLoad() async{
    userProf = User(
      Uid: await ProfileData.connect("P1001", "Uid"),
      Name: await ProfileData.connect("P1001", "Name"),
      Gender: await ProfileData.connect("P1001", "Gender"),
      Weight: await ProfileData.connect("P1001", "Weight"),
      Age: await ProfileData.connect("P1001", "Age"),
      Reg: await ProfileData.connect("P1001", "Reg"),
      Email: await ProfileData.connect("P1001", "Email"),
      Phone: await ProfileData.connect("P1001", "Phone"),
      Token: await ProfileData.connect("P1001", "Token"),
      Image: await ProfileData.connect("P1001", "Image"),
    );
  }

  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      buildButton(context, user.Weight, 'Weight'),
      buildDivider(),
      buildButton(context, user.Gender, 'Gender'),
      buildDivider(),
      buildButton(context, user.Age, 'Age'),
    ],
  );

  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider(),
  );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditProfilePage()),
          );
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}