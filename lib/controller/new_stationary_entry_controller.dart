import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_stationary.dart';
import 'package:college_shopify/model/stationary.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewStationaryEntryController extends GetxController {
  final Rx<List<Stationary>> stationary = Rx<List<Stationary>>([]);
  var _id;
  bool isLoading = false;
  String productImage = "";
  File? image;
  TextEditingController itemController = TextEditingController();
  TextEditingController costController = TextEditingController();

  Future<void> insertData(var userId) async {
    try {
      isLoading = true;
      update();

      productImage = await uploadProductImage(image, itemController.text);

      _id = M.ObjectId;
      final data = Stationary(
        id: _id,
        item: itemController.text,
        cost: costController.text,
        userId: userId,
        productImage: productImage,
      );

      Map<String, dynamic> result =
          await MongoDatabaseStationary().insert(data.toJson());
      log(result.toString());

      if (result["Success"] == true) {
        await updateData(_id, userId);
        Get.toNamed(
          RoutesNames.homeScreen,
          arguments: userId,
        );
        showSnackBar("Inserted ID: ", "${_id.$oid}");
      } else {
        showSnackBar("Error occurred", result["Msg"]);
      }
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
    } finally {
      isLoading = false;
      clearAll();
      update();
    }
  }

  clearAll() {
    itemController.text = "";
    costController.text = "";
    productImage = "";
  }

  selectImage() async {
    File? temp = await pickImage();
    if (temp != null) {
      image = temp;
      update();
    }
    //  else {
    //   showSnackBar("Error occurred", "Image was not picked");
    // }
  }
}
