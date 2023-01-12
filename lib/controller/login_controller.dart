import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

// TODO : Name should be AuthController

class LoginController extends GetxController {
  final Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  var userId;
  bool inserted = false;
  bool isLoading = true;

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

  // TODO : Return type will change when logic will be moved in controller (Make it void)
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

// TODO Parameters will change after shifting TextEditingController in AuthContoller
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
      boughtProducts: [],
    );
    Map<String, dynamic> result = await MongoDatabase.insert(data);
    log(result.toString());

    if (result["Success"] == true) {
      inserted = true;
      showSnackBar("Inserted ID:", "${userId.$oid}");
      // TODO : Named routes
      Get.to(
        () => HomeScreen(
          userId: userId,
        ),
      );
    } else {
      inserted = false;
      showSnackBar("Error occurred", result["Msg"]);
    }

    return inserted;
  }
}
