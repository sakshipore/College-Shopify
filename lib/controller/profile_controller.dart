import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/user.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, dynamic>? result = {};
  bool isLoading = true;
  bool isDisplayLoading = true;
  User? user;
  List<Product> uploadedProducts = [];
  List<Product> boughtProducts = [];

  Future<void> profileData(var userId) async {
    try {
      result = await MongoDatabase.fetchUserData(userId);
      log(result.toString());
      user = User.fromJson(result!);
      log("PROFILE DATA: " + user.toString());

      //! Uploaded products
      uploadedProducts.clear();
      for (var item in user?.product ?? []) {
        Product? temp = await productData(item);
        uploadedProducts.add(temp!);
      }

      //! Bought products
      boughtProducts.clear();
      for (var item in user?.boughtProducts ?? []) {
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
