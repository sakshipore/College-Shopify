import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/user.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class AuthController extends GetxController {
  final Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  var userId;
  bool inserted = false;
  bool isLoading = true;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController mobNoController = TextEditingController();
  @override
  void onInit() {
    connectToDB();
    super.onInit();
  }

  void connectToDB() async {
    MongoDatabase db = MongoDatabase();
    await db.connect();
    isLoading = false;
    update();
  }

  Future<void> checkUser(String mobNo) async {
    Map<String, dynamic>? userData;
    userData = await MongoDatabase.usersCollection.findOne({'mobNo': mobNo});
    if (userData == null) {
      showSnackBar("Error occurred", "User doesn't exist !");
      Get.toNamed(
        RoutesNames.signUpScreen,
      );
      return null;
    } else {
      log(userData.toString());
      userId = userData['id'];
      showSnackBar("User exists: ", userId.toString());
      Get.offAllNamed(
        RoutesNames.homeScreen,
        arguments: userId,
      );
      return;
    }
  }

  Future<void> insertData() async {
    userId = M.ObjectId();
    final data = User(
      id: userId,
      address: addressController.text,
      fname: fnameController.text,
      lname: lnameController.text,
      mobNo: mobNoController.text,
      product: [],
      boughtProducts: [],
    );
    Map<String, dynamic> result = await MongoDatabase.insert(data);
    log(result.toString());

    if (result["Success"] == true) {
      inserted = true;
      showSnackBar("Inserted ID:", "${userId.$oid}");
      _clearAll();
      Get.toNamed(
        RoutesNames.homeScreen,
        arguments: userId,
      );
    } else {
      inserted = false;
      showSnackBar("Error occurred", result["Msg"]);
      _clearAll();
    }

    return;
  }

  void _clearAll() {
    addressController.clear();
    fnameController.clear();
    lnameController.clear();
    mobNoController.clear();
  }
}
