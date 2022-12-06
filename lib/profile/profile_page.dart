import 'package:Patient_App/SurveyPage.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/edit_profile_page.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/profile/widget/appbar_widget.dart';
import 'package:Patient_App/profile/widget/numbers_widget.dart';
import 'package:Patient_App/profile/widget/profilepicture_widget.dart';

import '../MoodPage.dart';
import '../dashboard.dart';
import '../server/ProfileData.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List? userList;
  Future DBLoad() async{
    userList = await ProfileData.reconnect("P1001");
  }

  @override
  Widget build(BuildContext context) {
    int selectedindex = 3;
    return FutureBuilder(
        future: DBLoad(),
        builder: (context, snapshot){
          if(userList != null){
            return Scaffold(
              appBar: buildAppBar(context),
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: selectedindex,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (index) => setState(() {
                  selectedindex = index;
                  print(index);
                  if (index == 0) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Dashboard()));
                  }else if (index == 1) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MoodPage()));
                  }else if (index == 2) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SurveyPage()));
                  }else if (index == 3) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProfileMain()));
                  }
                }),
                items: <BottomNavyBarItem>[
                  BottomNavyBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    activeColor: Colors.red,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.emoji_emotions),
                    title: Text('Mood Log'),
                    activeColor: Colors.purpleAccent,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.menu_book_outlined),
                    title: Text('Survey'),
                    activeColor: Colors.blue,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(
                    icon: Icon(Icons.account_circle),
                    title: Text('Profile'),
                    activeColor: Colors.pink,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              body: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 24),
                  ProfilePictureWidget(
                    imagePath: userList![0]["Image"],
                    onClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                Column(
                  children: [
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => EditProfilePage()),
                        );
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Text(
                        userList![0]["Name"],
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      userList![0]["Email"],
                      style: TextStyle(),
                    )
                  ],
                ),

                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildButton(context, userList![0]["Weight"].toString()+"kg", 'Weight'),
                      buildDivider(),
                      buildButton(context, userList![0]["Gender"], 'Gender'),
                      buildDivider(),
                      buildButton(context, userList![0]["Age"].toString(), 'Age'),
                    ],
                  ),

                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfilePage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Edit Profile',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
          else{
            return const Scaffold(
                body:Center(child: CircularProgressIndicator())
            );//
          }
        }
    );

  }
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