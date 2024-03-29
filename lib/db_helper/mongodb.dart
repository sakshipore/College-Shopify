import 'dart:developer';

import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/model/user.dart';
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

  static delete(User user) async {
    await usersCollection.remove(where.id(user.id));
  }

  static Future<Map<String, dynamic>> insert(User data) async {
    try {
      usersCollection = db.collection(COLL_NAME);
      var result = await usersCollection.insertOne(data.toJson());
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

  static Future<Map<String, dynamic>> insertByCollectionName(
      Map<String, dynamic> data, String collectionName) async {
    try {
      DbCollection collection = db.collection(collectionName);
      log("COLLECTION-> $collectionName");
      var result = await collection.insertOne(data);
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

  static Future<List<Map<String, dynamic>>> getCollectionData(
      String collectionName) async {
    DbCollection collection = db.collection(collectionName);
    final arrData = await collection.find().toList();
    log(arrData.toString());
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await usersCollection.find().toList();
    log(arrData.toString());
    return arrData;
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

  static Future<Map<String, dynamic>?> fetchProductData(var productId) async {
    Map<String, dynamic>? userData;
    DbCollection allProductCollection = db.collection(ALLPRODUCTS_COLL);
    userData = await allProductCollection.findOne({'productId': productId});
    if (userData == null) {
      return null;
    } else {
      log(userData.toString());
      return userData;
    }
  }

  static Future<Map<String, dynamic>> update(
      var userId, List productIds) async {
    try {
      var result = await usersCollection.update(
          where.eq('id', userId), modify.set('product', productIds));
      return result;
    } catch (e) {
      return {
        "Success": false,
        "Msg": e.toString(),
      };
    }
  }

  static Future<Map<String, dynamic>> updateBuyProduct(
      var userId, List productIds) async {
    try {
      var result = await usersCollection.update(
          where.eq('id', userId), modify.set('boughtProducts', productIds));
      return result;
    } catch (e) {
      return {
        "Success": false,
        "Msg": e.toString(),
      };
    }
  }
}
