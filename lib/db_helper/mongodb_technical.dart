import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseTechnical {
  static late Db db;
  static late DbCollection technicalCollection;
  MongoDatabaseTechnical() {
    db = MongoDatabase.db;
    connect();
  }
  connect() async {
    try {
      // db = await Db.create(MONGO_CONN_URL);
      // await db.open();
      // inspect(db);
      technicalCollection = db.collection(TECHNICAL_COLL);
      log(technicalCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async {
    try {
      technicalCollection = db.collection(TECHNICAL_COLL);
      var result = await technicalCollection.insertOne(data);
      if (result.isSuccess) {
        return {
          "Success": true,
          "Msg": "Data inserted",
        };
      } else {
        return {
          "Success": true,
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
    log("GETIING DATA");
    final arrData = await technicalCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}
