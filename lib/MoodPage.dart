import 'package:Patient_App/SurveyPage.dart';
import 'package:Patient_App/survey/surveymain.dart';
import 'package:Patient_App/util/emoticons.dart';
import 'package:Patient_App/util/music_player.dart';
import 'package:Patient_App/util/save_sucess.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/statistics/stats_page.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({Key? key}) : super(key: key);

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  var boxColor1 = Colors.grey.shade200;
  var boxColor2 = Colors.grey.shade200;
  var boxColor3 = Colors.grey.shade200;
  var boxColor4 = Colors.grey.shade200;
  var boxColor5 = Colors.grey.shade200;
  String flag = "clear";
  User user = UserPreferences.myUser;
  String date = '';
  int selectedindex = 1;
  late Widget selectedWidget;


  bool tappedDone = false;

  //scroll controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
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

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    //title
                    //activity log title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Activity & Mood Log',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //activity log box
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Input your activity here',
                            ),
                            onSubmitted: (text){

                            },
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //emoticons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //very calm
                        Column(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                print("before: $flag");
                                if(identical(flag, "clear")){
                                  setState(() {
                                    boxColor1 = Colors.grey.shade400;
                                  });
                                  flag = "V. Calm";
                                  print("after: $flag");
                                }else if(flag == "V. Calm"){
                                  setState(() {
                                    boxColor1 = Colors.grey.shade200;
                                  });
                                  flag = "clear";
                                  print("after: $flag");
                                }else{
                                  final action = await SaveSuccess.doneDialog(context, 'Info', 'Please unselect other mood first.');
                                }
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                  color: boxColor1,
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(12),
                                duration: Duration(seconds: 0),
                                child: Container(
                                  child: Image.asset(
                                    "assets/emoticons/verycalm.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                            height: 8,
                          ),
                            Text(
                            'Very Calm',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                          ],
                        ),

                        //calm
                        Column(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                print("before: $flag");
                                if(identical(flag, "clear")){
                                  setState(() {
                                    boxColor2 = Colors.grey.shade400;
                                  });
                                  flag = "Calm";
                                  print("after: $flag");
                                }else if(flag == "Calm"){
                                  setState(() {
                                    boxColor2 = Colors.grey.shade200;
                                  });
                                  flag = "clear";
                                  print("after: $flag");
                                }else{
                                  final action = await SaveSuccess.doneDialog(context, 'Info', 'Please unselect other mood first.');
                                }
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: boxColor2,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(12),
                                duration: Duration(seconds: 0),
                                child: Container(
                                  child: Image.asset(
                                    "assets/emoticons/calm.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Calm',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        //neutral
                        Column(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                print("before: $flag");
                                if(identical(flag, "clear")){
                                  setState(() {
                                    boxColor3 = Colors.grey.shade400;
                                  });
                                  flag = "Neutral";
                                  print("after: $flag");
                                }else if(flag == "Neutral"){
                                  setState(() {
                                    boxColor3 = Colors.grey.shade200;
                                  });
                                  flag = "clear";
                                  print("after: $flag");
                                }else{
                                  final action = await SaveSuccess.doneDialog(context, 'Info', 'Please unselect other mood first.');
                                }
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: boxColor3,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(12),
                                duration: Duration(seconds: 0),
                                child: Container(
                                  child: Image.asset(
                                    "assets/emoticons/neutral.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Neutral',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        //Stressed
                        Column(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                print("before: $flag");
                                if(identical(flag, "clear")){
                                  setState(() {
                                    boxColor4 = Colors.grey.shade400;
                                  });
                                  flag = "Stressed";
                                  print("after: $flag");
                                }else if(flag == "Stressed"){
                                  setState(() {
                                    boxColor4 = Colors.grey.shade200;
                                  });
                                  flag = "clear";
                                  print("after: $flag");
                                }else{
                                  final action = await SaveSuccess.doneDialog(context, 'Info', 'Please unselect other mood first.');
                                }
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: boxColor4,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(12),
                                duration: Duration(seconds: 0),
                                child: Container(
                                  child: Image.asset(
                                    "assets/emoticons/stressed.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Stressed',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),

                        //very Stressed
                        Column(
                          children: [
                            GestureDetector(
                              onTap: ()async{
                                print("before: $flag");
                                if(identical(flag, "clear")){
                                  setState(() {
                                    boxColor5 = Colors.grey.shade400;
                                  });
                                  flag = "V. Stressed";
                                  print("after: $flag");
                                }else if(flag == "V. Stressed"){
                                  setState(() {
                                    boxColor5 = Colors.grey.shade200;
                                  });
                                  flag = "clear";
                                  print("after: $flag");
                                }else{
                                  final action = await SaveSuccess.doneDialog(context, 'Info', 'Please unselect other mood first.');
                                }
                              },
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: boxColor5,
                                    borderRadius: BorderRadius.circular(12)
                                ),
                                padding: EdgeInsets.all(12),
                                duration: Duration(seconds: 0),
                                child: Container(
                                  child: Image.asset(
                                    "assets/emoticons/verystressed.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Very Stressed',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),

                    //input button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: ()async {
                            final action = await SaveSuccess.doneDialog(context, 'Success', 'Activity and mood successfully logged !');
                            print("ada tak");
                            if(action == DialogsAction.done) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => MoodPage()));
                              setState(() => tappedDone = true);
                            } else {
                              setState(() => tappedDone = false);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Log Data',
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

                        SizedBox(
                          width: 2,
                        ),

                        //stats page button
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StatsPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              height: 50,
                              width: 150,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text('Statistics',
                                  style: TextStyle(
                                    color: Colors.white,
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
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Ambient sound',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MusicPlayerPage()),
                                );
                              },
                              child : Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    child:ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: SizedBox.fromSize(
                                        size: Size.fromRadius(48),
                                        child: Image.asset('assets/music_cover_pic/universe.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),),),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Space',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                                height: 80,
                                width: 80,
                                child:ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48),
                                    child: Image.asset(
                                        'assets/music_cover_pic/forest.jfif',
                                        fit: BoxFit.fill,
                                      ),
                                    ),),),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Forest',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                                child:ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(48),
                                    child: Image.asset(
                                      'assets/music_cover_pic/tide.jpg',
                                      fit: BoxFit.fill,
                                  ),
                              ),),),

                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Tide',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48), // Image radius
                                  child: Image.asset(
                                      'assets/music_cover_pic/city.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'City',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 10,
                            ),
                          ),
                          ],),
                        ],
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Trigger sound',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48), // Image radius
                                  child: Image.asset(
                                      'assets/music_cover_pic/clock.jpg',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Clock',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.asset(
                                    'assets/music_cover_pic/moktak.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),),),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'WoodFish',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.asset(
                                    'assets/music_cover_pic/Singing_bowl.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),),),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Singing Bowl',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 0.1,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(48),
                                  child: Image.asset('assets/music_cover_pic/cat.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),),),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Cat',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                  ]),
            ),
          ),
        )
    );
  }
}

