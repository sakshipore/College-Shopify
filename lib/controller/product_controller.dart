import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/controller/book_controller.dart';
import 'package:college_shopify/controller/stationary_controller.dart';
import 'package:college_shopify/controller/technical_controller.dart';
import 'package:college_shopify/db_helper/common_db_functions.dart';
import 'package:college_shopify/db_helper/mongodb_all_products.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class ProductEntryController extends GetxController {
  // final Rx<List<Book>> book = Rx<List<Book>>([]);
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
  String selectedValue = "Select Product Type";
  final BookEntryController bookEntryController =
      Get.put(BookEntryController());
  final StationaryEntryController stationartEntryController =
      Get.put(StationaryEntryController());
  final TechnicalEntryController technicalEntryController =
      Get.put(TechnicalEntryController());
  Product? lastAddedProduct;

  Future<List<Map<String, dynamic>>> displayData() async {
    try {
      result = await MongoDatabaseAllProducts().getData();
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

  String updateDropDown(String value) {
    selectedValue = value;
    update();
    return selectedValue;
  }

  Future insertData(var userId) async {
    try {
      isLoading = true;
      update();

      productImage =
          await uploadProductImage(image, productNameController.text);

      _id = M.ObjectId();
      final data = Product(
        productId: _id,
        productName: productNameController.text,
        productCost: productCostController.text,
        productSpecification: productSpecificationController.text,
        productType: productTypeController.text,
        userId: userId,
        productImage: productImage,
      );

      Map<String, dynamic> result =
          await MongoDatabaseAllProducts().insert(data.toJson());
      log(result.toString());

      if (result["Success"] == true) {
        lastAddedProduct = data;
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

  Future<void> segregateData(String value, var userId) async {
    try {
      isLoading = true;
      log("CONTROLLER-> " + value);
      log(userId.toString());
      if (value == "Book") {
        await bookEntryController.insertData(userId, lastAddedProduct);
        log("SEGREGATED SUCCESSFULLY IN BOOK");
      } else if (value == "Stationary") {
        await stationartEntryController.insertData(userId, lastAddedProduct);
        log("SEGREGATED SUCCESSFULLY IN STATIONARY");
      } else if (value == "Technical") {
        await technicalEntryController.insertData(userId, lastAddedProduct);
        log("SEGREGATED SUCCESSFULLY IN TECH");
      }
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
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
    //else {
    //   showSnackBar("Error occurred", "Image was not picked");
    // }
  }
}