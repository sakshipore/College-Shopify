import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_stationary.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewStationaryEntryController extends GetxController {
  // final Rx<List<Stationary>> stationary = Rx<List<Stationary>>([]);
  var _id;
  bool isLoading = false;
  bool isDisplayLoading = false;
  String productImage = "";
  File? image;
  List<Map<String, dynamic>> result = [];
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCostController = TextEditingController();
  TextEditingController productSpecificationController =
      TextEditingController();
  

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

  Future<void> insertData(var userId) async {
    try {
      isLoading = true;
      update();

      productImage = await uploadProductImage(image, productNameController.text);

      _id = M.ObjectId();
      final data = Product(
        productId: _id,
        productName: productNameController.text,
        productCost: productCostController.text,
        productSpecification: productSpecificationController.text,
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
    productNameController.text = "";
    productCostController.text = "";
    productSpecificationController.text = "";
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
