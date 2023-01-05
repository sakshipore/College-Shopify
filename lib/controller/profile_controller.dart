import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic>? result = {};
  bool isLoading = true;
  MongoDBModel? data;

  Future<void> profileData(var userId) async {
    try {
      result = await MongoDatabase.fetchUserData(userId);
      data = MongoDBModel.fromJson(result!);
      log("PROFILE DATA: " + data.toString());
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
