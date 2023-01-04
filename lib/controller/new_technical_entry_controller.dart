import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_technical.dart';
import 'package:college_shopify/model/technical.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewTechnicalEntryController extends GetxController {
  final Rx<List<Technical>> technical = Rx<List<Technical>>([]);
  M.ObjectId? _id;
  bool isLoading = false;
  bool isDisplayLoading = true;
  String productImage = "";
  File? image;
  List<Map<String, dynamic>> result = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController modelNoController = TextEditingController();
  TextEditingController specificationController = TextEditingController();
  TextEditingController billNoController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController costController = TextEditingController();

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

  Future<void> insertData(var userId) async {
    try {
      isLoading = true;
      update();

      productImage = await uploadProductImage(image, nameController.text);
      log("*************************");
      _id = M.ObjectId();
      log(userId.toString());
      final data = Technical(
        id: _id!,
        name: nameController.text,
        modelNo: modelNoController.text,
        specification: specificationController.text,
        billNo: billNoController.text,
        companyName: companyNameController.text,
        cost: costController.text,
        userId: userId,
        productImage: productImage,
      );
      log(_id.toString());
      Map<String, dynamic> result =
          await MongoDatabaseTechnical().insert(data.toJson());
      log(result.toString());

      if (result["Success"] == true) {
        await updateData(_id, userId);
        Get.toNamed(
          RoutesNames.homeScreen,
          arguments: userId,
        );
        showSnackBar("Inserted ID: ", "${_id!.$oid}");
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
    nameController.text = "";
    modelNoController.text = "";
    specificationController.text = "";
    billNoController.text = "";
    companyNameController.text = "";
    costController.text = "";
    productImage = "";
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
