import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseStationary {
  static late Db db;
  static late DbCollection stationaryCollection;
  MongoDatabaseStationary() {
    db = MongoDatabase.db;
    connect();
  }
  connect() async {
    try {
      // db = await Db.create(MONGO_CONN_URL);
      // await db.open();
      // inspect(db);
      stationaryCollection = db.collection(STATIONARY_COLL);
      log(stationaryCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async {
    try {
      stationaryCollection = db.collection(STATIONARY_COLL);
      var result = await stationaryCollection.insertOne(data);
      if (result.isSuccess) {
        return {
          "Success": true,
          "Msg": "Data inserted",
        };
      } else {
        return {
          "Success": false,
          "Msg": "Something went wrong",
        };
      }
    } catch (e) {
      return {
        "Success": false,
        "Msg": e.toString(),
      };
    }
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await stationaryCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}
