import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb_stationary.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';

class StationaryEntryController extends GetxController {
  bool isLoading = false;
  bool isDisplayLoading = false;
  List<Map<String, dynamic>> result = [];  

  Future<List<Map<String, dynamic>>> displayData() async {
    try {
      result = await MongoDatabaseStationary().getData();
      int totalLength = result.length;
      log(totalLength.toString());
      isDisplayLoading = false;
      update();
      return result;
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
      isDisplayLoading = false;
      update();
      return result;
    }
  }

  Future<void> insertData(var userId, Product? product) async {
    try {
      isLoading = true;
      update();

      Map<String, dynamic> result =
          await MongoDatabaseStationary().insert(product!.toJson());
      log(result.toString());

      if (result["Success"] == true) {
        log("USer id before navigating: $userId");
        Get.toNamed(
          RoutesNames.homeScreen,
          arguments: userId,
        );
        // showSnackBar("Inserted ID: ", "${_id.$oid}");
      } else {
        showSnackBar("Error occurred in else", result["Msg"]);
      }
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred in catch", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> updateBoughtData(var userId, var productId) async {
    try {
      await updateBoughtData(userId, productId);
      Get.toNamed(
        RoutesNames.homeScreen,
        arguments: userId,
      );
      showSnackBar("Updated ID: ", "$userId");
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
    }
  }
}
