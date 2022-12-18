import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class LoginController extends GetxController {
  final Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});
  // static LoginController instance = Get.find();
  // static late DbCollection usersCollection;
  var userId;
  bool inserted = false;
  bool isLoading = true;

  @override
  void onInit() {
    connectToDB();
    super.onInit();
    isLoading = false;
  }

  void connectToDB() async {
    MongoDatabase db = MongoDatabase();
    await db.connect();
  }

  Future<Map<String, dynamic>?> checkUser(String mobNo) async {
    Map<String, dynamic>? userData;
    userData = await MongoDatabase.usersCollection.findOne({'mobNo': mobNo});
    if (userData == null) {
      return null;
    } else {
      log(userData.toString());
      return userData;
    }
  }

  Future<bool> insertData(
      String fname, String lname, String address, String mobNo) async {
    userId = M.ObjectId();
    final data = MongoDBModel(
      id: userId,
      address: address,
      fname: fname,
      lname: lname,
      mobNo: mobNo,
      product: [],
    );
    Map<String, dynamic> result = await MongoDatabase.insert(data);
    log(result.toString());

    if (result["Success"] == true) {
      inserted = true;
      showSnackBar("Inserted ID:", "${userId.$oid}");
    } else {
      inserted = false;
      showSnackBar("Error occurred", result["Msg"]);
    }

    return inserted;
  }
}
