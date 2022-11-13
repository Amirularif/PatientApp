import 'dart:math';

import 'package:Patient_App/server/MoodLogData.dart';
import 'package:flutter/material.dart';
import 'package:Patient_App/dashboard.dart';
import 'package:Patient_App/profile/profilemain.dart';
import 'package:Patient_App/statistics/stats_card.dart';
import 'package:hexcolor/hexcolor.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {

  var logList = [];
  Future DBLoad() async{
    logList = await MoodLogData.connect("P1001");
    //print(logList[0]["date"]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DBLoad(),
        builder: (context, snapshot){
          if(logList != null){
            return Scaffold(
              backgroundColor: Colors.grey.shade100,
              appBar: AppBar(
                leading: BackButton(
                  color: Colors.black87,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text('Statistics'),
                titleTextStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,),
                centerTitle: true,
              ),
              body: SafeArea(
                child: ListView.builder(
                  itemCount: logList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      color: HexColor(logList[index]["Colors"]),
                      //0xFFC0DAFF
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 80,width: 15),
                          SizedBox(
                            width: (75),
                            child: Text(
                            logList[index]["Mood"],
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                          ),

                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(logList[index]["Desc"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(logList[index]["Date"]),
                          ]

                          ),
                        ],
                      ),
                    );

                  },
                ),
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
}

