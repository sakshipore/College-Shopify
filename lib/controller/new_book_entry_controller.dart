import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_book.dart';
import 'package:college_shopify/model/books.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewBookEntryController extends GetxController {
  final Rx<List<Book>> book = Rx<List<Book>>([]);
  var _id;
  bool isLoading = false;
  bool isDisplayLoading = true;
  String productImage = "";
  File? image;
  List<Map<String, dynamic>> result = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController publicationController = TextEditingController();

  Future<List<Map<String, dynamic>>> displayData() async {
    try {
      result = await MongoDatabaseBook().getData();
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

      _id = M.ObjectId();
      final data = Book(
        id: _id,
        name: nameController.text,
        author: authorController.text,
        cost: costController.text,
        edition: editionController.text,
        publication: publicationController.text,
        userId: userId,
        productImage: productImage,
      );

      Map<String, dynamic> result =
          await MongoDatabaseBook().insert(data.toJson());
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

  clearAll() {
    nameController.text = "";
    authorController.text = "";
    costController.text = "";
    editionController.text = "";
    publicationController.text = "";
    productImage = "";
  }

  selectImage() async {
    File? temp = await pickImage();
    if (temp != null) {
      image = temp;
      update();
    }
    //else {
    //   showSnackBar("Error occurred", "Image was not picked");
    // }
  }
}
