import 'dart:math';

import 'package:Patient_App/server/SurveyData.dart';
import 'package:Patient_App/survey/surveymain.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:Patient_App/profile/user.dart';
import 'package:Patient_App/profile/user_preferences.dart';
import 'package:Patient_App/statistics/stats_page.dart';
import 'package:intl/intl.dart';

import 'MoodPage.dart';
import 'dashboard.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  User user = UserPreferences.myUser;
  String date = '';
  int selectedindex = 2;
  late Widget selectedWidget;
  List<SurveyHistory> surveyinfo = [

    const SurveyHistory(date: "04/11/2022"),
    const SurveyHistory(date: "21/10/2022"),
    const SurveyHistory(date: "04/10/2022"),
    const SurveyHistory(date: "27/09/2022"),
    const SurveyHistory(date: "20/09/2022"),
    const SurveyHistory(date: "13/09/2022"),
    const SurveyHistory(date: "06/09/2022"),
    const SurveyHistory(date: "29/08/2022"),
    const SurveyHistory(date: "22/08/2022"),

  ];


  bool tappedDone = false;

  //scroll controller
  final _controller = PageController();

  var logList = [];
  String recent = "01/01/2022";
  Future DBLoad() async{
    logList = await SurveyData.connect("P1001");
    int last = logList.length - 1;
    recent = logList[last]["Date"];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBLoad(),
        builder: (context, snapshot){
          if(logList != null){
            return Scaffold(
              backgroundColor: Colors.grey.shade100,
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: selectedindex,
                showElevation: true,
                itemCornerRadius: 24,
                curve: Curves.easeIn,
                onItemSelected: (index) =>
                    setState(() {
                      selectedindex = index;
                      print(index);
                      if (index == 0) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Dashboard()));
                      } else if (index == 1) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MoodPage()));
                      } else if (index == 2) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SurveyPage()));
                      } else if (index == 3) {
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
                          //hi user!
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '최근 작성 날짜',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                recent,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),

                          Divider(
                              thickness: 1,
                              color: Colors.grey
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '기프티콘 수량',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                logList.length.toString() + '개',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          //survey history title
                          Text(
                            'Survey History',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          //Survey history
                          Container(
                            height: 320,
                            width: 360,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            prefixIcon(),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.only(top: 7.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: RichText(
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        text: TextSpan(
                                                          text: logList[index]["Date"],
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Colors.grey.shade900,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Divider(height: 0,thickness: 1,);
                                  }, itemCount: surveyinfo.length),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //survey button
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SurveyMainPage()),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: 360,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              padding: EdgeInsets.all(12),
                              child: Center(
                                child: Text(
                                  '작성 시작',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '토큰 유효기간 ',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                '2022년 12월 31일',
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              )
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

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            prefixIcon(),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    surveydate(index),
                  ],),
              ),
            ),
          ]),
    );
  }

  Widget prefixIcon() {
    return Container(
      height: 30,
      width: 30,
      padding: EdgeInsets.all(2),
      child: Icon(
        Icons.monitor_heart_rounded,
        size: 30,
        color: Colors.redAccent.shade200,
      ),
    );
  }

  Widget surveydate(int index) {
    final info = surveyinfo[index];
    return Container(
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: info.date,
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold
            ),
        ),
      ),
    );
  }
}


class SurveyHistory {
  final String date;

  const SurveyHistory({
    required this.date,
  });

}

