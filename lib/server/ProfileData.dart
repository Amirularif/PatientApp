import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class ProfileData{
  static var db, userCollection;
  static var sampler;

  static connect(String UID,String creds) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected for prompt: $creds");
    }
    userCollection = db.collection(DOC_PROFILE);
    var sample = await userCollection.find({"Uid": UID}).toList();
    var data = sample[0][creds];
    db.close();

    return data;
  }
  static reconnect(String UID) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected for main list");
    }
    userCollection = db.collection(DOC_PROFILE);
    var sample = await userCollection.find({"Uid": UID}).toList();
    //var data = sample[0][creds];
    db.close();

    return sample;
  }
  static update(String UID,String creds, String edit) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print("MongoDB Connected for update");
    }
    userCollection = db.collection(DOC_PROFILE);
    userCollection.updateOne(where.eq('Uid', UID), modify.set(creds, edit));
    db.close();
  }

}
