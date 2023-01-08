import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabaseAllProducts {
  static late Db db;
  static late DbCollection allProductsCollection;
  MongoDatabaseAllProducts() {
    db = MongoDatabase.db;
    connect();
  }

  connect() async {
    try {
      allProductsCollection = db.collection(ALLPRODUCTS_COLL);
      log(allProductsCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Map<String, dynamic>> insert(Map<String, dynamic> data) async {
    try {
      allProductsCollection = db.collection(ALLPRODUCTS_COLL);
      var result = await allProductsCollection.insertOne(data);
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
    final arrData = await allProductsCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }
}
