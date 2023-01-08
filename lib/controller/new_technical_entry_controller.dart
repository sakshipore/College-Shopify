import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_technical.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewTechnicalEntryController extends GetxController {
  // final Rx<List<Technical>> technical = Rx<List<Technical>>([]);
  var _id;
  bool isLoading = false;
  bool isDisplayLoading = true;
  String productImage = "";
  File? image;
  List<Map<String, dynamic>> result = [];
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCostController = TextEditingController();
  TextEditingController productSpecificationController =
      TextEditingController();
  TextEditingController productTypeController = TextEditingController();

  Future<List<Map<String, dynamic>>> displayData() async {
    try {
      result = await MongoDatabaseTechnical().getData();
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

  Future<void> insertData(var userId, {Product? product}) async {
    try {
      isLoading = true;
      update();

      // productImage =
      //     await uploadProductImage(image, productNameController.text);
      log("***********IN TECH**************");
      // _id = M.ObjectId();
      // log(userId.toString());
      // final data = Product(
      //   productId: _id,
      //   productName: productNameController.text,
      //   productCost: productCostController.text,
      //   productSpecification: productSpecificationController.text,
      //   productType: productTypeController.text,
      //   userId: userId,
      //   productImage: productImage,
      // );
      // log(_id.toString());
      Map<String, dynamic> result =
          await MongoDatabaseTechnical().insert(product!.toJson());
      log("Tech result : " + result.toString());

      if (result["Success"] == true) {
        // await updateData(product.productId, userId);
        log("User id before navigating : $userId");
        Get.toNamed(
          RoutesNames.homeScreen,
          arguments: userId,
        );
      } else {
        showSnackBar("TECH Error occurred in else ", result["Msg"]);
      }
    } catch (e) {
      log(e.toString());
      showSnackBar("TECH Error occurred in catch", e.toString());
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
    productTypeController.text = "";
  }

  selectImage() async {
    File? temp = await pickImage();
    if (temp != null) {
      image = temp;
      update();
    }
    // else {
    //   showSnackBar("Error occurred", "Image was not picked");
    // }
  }
}
