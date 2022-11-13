import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class MoodLogData{
  static var db, userCollection;
  static var sampler;

  static connect(String UID) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected for user log: $UID");
    }
    userCollection = db.collection("Log_Lifelog");
    var sample = await userCollection.find({"Uid": UID}).toList();
    db.close();

    return sample;
  }

  //add moodlog
  static addMoodLog(String UID, String date, String desc, String mood) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("Connected for moodlog: $UID");
    }
    String colors = "#FFFFFF";
    switch(mood) {
      case "V. Calm": {
        colors = "#A7FF99";
      }break;
      case "Calm": {
        colors = "#C0DAFF";
      }break;
      case "Neutral": {
        colors = "#FCFC82";
      }break;
      case "Stressed": {
        colors = "#FCE882";
      }break;
      case "V. Stressed": {
        colors = "#F8BF48";
      }break;

      default: {
        print("mood input error");
      }
      break;
    }

    userCollection = db.collection("Log_Lifelog");
    var ret = await userCollection.insertOne(<String, dynamic>{
      'Date': date,
      'Uid': UID,
      'Desc': desc,
      'Mood': mood,
      'Colors': colors
    });

    if (!ret.isSuccess) {
      print('Error detected in record insertion');
    }
    db.close();
  }

}