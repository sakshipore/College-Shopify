import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:mongo_dart/mongo_dart.dart';


class MongoDatabase {
  static late Db db;
  static late DbCollection usersCollection;

  connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      usersCollection = db.collection(COLL_NAME);
      log(usersCollection.collectionName);
    } catch (e) {
      log(e.toString());
    }
  }

  static delete(MongoDBModel user) async {
    await usersCollection.remove(where.id(user.id));
  }

  static Future<String> insert(MongoDBModel data) async {
    try {
      usersCollection = db.collection(COLL_NAME);
      var result = await usersCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something went wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await usersCollection.find().toList();
    log(arrData.toString());
    return arrData;
  }

  static Future<Map<String, dynamic>?> checkUser(String mobNo) async {
    Map<String, dynamic>? userData;
    userData = await usersCollection.findOne({'mobNo': mobNo});
    if (userData == null) {
      return null;
    } else {
      log(userData.toString());
      return userData;
    }
  }

  static Future<Map<String, dynamic>?> fetchUserData(var userId) async {
    Map<String, dynamic>? userData;
    userData = await usersCollection.findOne({'id': userId});
    if (userData == null) {
      return null;
    } else {
      log(userData.toString());
      return userData;
    }
  }

  static Future<Map<String, dynamic>> update(
      var userId, List productIds) async {
    var result = await usersCollection.update(
        where.eq('id', userId), modify.set('product', productIds));
    return result;
  }
}
