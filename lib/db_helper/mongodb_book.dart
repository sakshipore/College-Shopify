import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseBook {
  static late Db db;
  static late DbCollection bookCollection;
  MongoDatabaseBook() {
    db = MongoDatabase.db;
    connect();
  }
  connect() async {
    try {
      // db = await Db.create(MONGO_CONN_URL);
      // await db.open();
      // inspect(db);
      bookCollection = db.collection(BOOK_COLL);
      log(bookCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async {
    try {
      bookCollection = db.collection(BOOK_COLL);
      var result = await bookCollection.insertOne(data);
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
    log("GETTING DATA");
    final arrData = await bookCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}
