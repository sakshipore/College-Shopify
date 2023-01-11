import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final Rx<Map<String, dynamic>> user = Rx<Map<String, dynamic>>({});

  Map<String, dynamic>? result = {};
  bool isLoading = true;
  bool isDisplayLoading = true;
  MongoDBModel? data;
  List<Product> uploadedProducts = [];
  List<Product> boughtProducts = [];

  Future<void> profileData(var userId) async {
    try {
      result = await MongoDatabase.fetchUserData(userId);
      log(result.toString());
      data = MongoDBModel.fromJson(result!);
      log("PROFILE DATA: " + data.toString());

      //! Uploaded products
      for (var item in data?.product ?? []) {
        Product? temp = await productData(item);
        uploadedProducts.add(temp!);
      }

      //! Bought products
      for (var item in data?.boughtProducts ?? []) {
        Product? temp = await productData(item);
        boughtProducts.add(temp!);
      }
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<Product?> productData(var productId) async {
    try {
      result = await MongoDatabase.fetchProductData(productId);
      Product temp = Product.fromJson(result!);
      log("PROFILE DATA: " + temp.toString());
      return temp;
    } catch (e) {
      log(e.toString());
      showSnackBar("Error occurred", e.toString());
      return null;
    } finally {
      isDisplayLoading = false;
      update();
    }
  }
}
