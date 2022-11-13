import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class SurveyData{
  static var db, userCollection;
  static var sampler;

  static connect(String UID) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected for user log: $UID");
    }
    userCollection = db.collection("Log_GAD7");
    var sample = await userCollection.find({"Uid": UID}).toList();
    db.close();

    return sample;
  }

  //add moodlog
  static addSurvey(String UID, String date) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("Connected for moodlog: $UID");
    }

    userCollection = db.collection("Log_GAD7");
    var ret = await userCollection.insertOne(<String, dynamic>{
      'Date': date,
      'Uid': UID,
    });

    if (!ret.isSuccess) {
      print('Error detected in record insertion');
    }else{
      print("Survey data added");
    }
    db.close();
  }

}