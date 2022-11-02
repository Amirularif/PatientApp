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

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    int selectedindex = 3;
    return Builder(
        builder: (context) => Scaffold(
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
                imagePath: user.imagePath,
                onClicked: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                },
              ),

              const SizedBox(height: 24),
              buildName(user),

              const SizedBox(height: 24),
              NumbersWidget(),

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
        ),
    );
  }

  Widget buildName(User user) => Column(
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
          user.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: TextStyle(),
      )
    ],
  );
}