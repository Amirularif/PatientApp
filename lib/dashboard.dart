import 'package:Patient_App/SurveyPage.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/graph/FitHeart.dart';
import 'package:Patient_App/graph/FitSleep.dart';
import 'package:Patient_App/graph/FitStep.dart';
import 'package:Patient_App/graph/FitWeight.dart';
import 'package:Patient_App/graph/graph_cards.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/statistics/stats_page.dart';
import 'package:Patient_App/util/emoticons.dart';
import 'package:Patient_App/util/save_sucess.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:intl/intl.dart';

import 'MoodPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User user = UserPreferences.myUser;
  String date = '';
  int selectedindex = 0;
  late Widget selectedWidget;
  List<Message> messages = [
    const Message(
        messagesdetail: "Don't forget to do your survey.",
        time: "7:05 am",
        date: "22/10/2022"),
    const Message(
        messagesdetail: "Drink more water.",
        time: "9:15 am",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Rest Well.",
        time: "12:55 pm",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        date: "25/10/2022"),
    const Message(
        messagesdetail: "Don't forget to do your survey.",
        time: "7:05 am",
        date: "22/10/2022"),
    const Message(
        messagesdetail: "Drink more water.",
        time: "9:15 am",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Rest Well.",
        time: "12:55 pm",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        date: "25/10/2022"),
    const Message(
        messagesdetail: "Don't forget to do your survey.",
        time: "7:05 am",
        date: "22/10/2022"),
    const Message(
        messagesdetail: "Drink more water.",
        time: "9:15 am",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Rest Well.",
        time: "12:55 pm",
        date: "23/10/2022"),
    const Message(
        messagesdetail: "Don't forget to update your fitbit token.",
        time: "10:55 am",
        date: "25/10/2022"),
  ];
  
  String dateinit(){
    var now = new DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  void initState(){
    date = dateinit();
  }

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //hi user!
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Dashboard',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(date,
                          style: TextStyle(color: Colors.black87),
                        ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //menu title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '의사 진단',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //notyfication
                  Container(
                      height: 250,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                        padding: EdgeInsets.all(5),
                    child: ListView.separated(
                        itemBuilder: (context,index){
                      return listViewItem(index);
                    },
                        separatorBuilder: (context,index){
                          return Divider(height: 0);
                          },
                        itemCount: messages.length),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //token information title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Token Info',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //token container
                Container(
                      height: 120,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    padding: const EdgeInsets.fromLTRB(30,10,15,15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            '7',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 0.1,
                          ),
                          Text(
                            'days left',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 25,
                      ),
                      VerticalDivider(
                          thickness: 1,
                          color: Colors.grey
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'TOKEN STATUS',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),

                          Text(
                            '● Updated',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 13,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            'NEXT UPDATE',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),

                          Text(
                            '● 7 days time',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                    ),

                  SizedBox(
                    height: 25,
                  ),

                  //renew token button
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StatsPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('Renew Token',
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
            ),
          ),
        )
    );
  }

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              padding:EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeanddate(index),
                ],),
            ),
            ),
        ]),
      );
  }

  Widget message(int index) {
    final info = messages[index];
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: '메세지 : ',
          style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.bold
          ),
          children: [
            TextSpan(
              text: info.messagesdetail,
              style: TextStyle(
                fontWeight: FontWeight.w400
              )
            )
          ]
        ),
      ),
    );
  }

  Widget timeanddate(int index) {
    final info = messages[index];
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text(info.date,
                style: TextStyle(
                fontSize: 10),
              ),
              Text(
                info.time,
                style: TextStyle(
                    fontSize: 10),
              ),
            ]
        ),
      );
  }

  Widget prefixIcon() {
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: Icon(
        Icons.notifications,
        size: 20,
        color: Colors.grey.shade700,
      ),
    );
  }
}
class Message{
  final String messagesdetail;
  final String time;
  final String date;

  const Message({
    required this.messagesdetail,
    required this.time,
    required this.date,
  });
}

