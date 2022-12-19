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
  //! VARIABLES
  final Rx<List<Book>> book = Rx<List<Book>>([]);
  var _id;
  bool isLoading = false;
  String productImage = "";
  File? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController publicationController = TextEditingController();

  //! FUNCTIONS
  Future<void> insertData(var userId) async {
    try {
      isLoading = true;
      update();

      //! FIRST UPLOAD THE IMAGE TO GET URL
      productImage = await uploadProductImage(image, nameController.text);

      //! SECOND ADD BOOK TO DB
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
        //! BOOK UPLOADED SUCCESSFULLY , NOW UPDATE DATA
        await updateData(_id, userId);
        Get.toNamed(
          RoutesNames.homeScreen,
          arguments: userId,
        );
        showSnackBar("Inserted ID:", "${_id.$oid}");
      } else {
        showSnackBar("Error occurred", result["Msg"]);
      }
    } catch (e) {
      showSnackBar("Error occurred", e.toString());
    } finally {
      isLoading = false;
      clearAll();
      update();
    }
  }

  clearAll() {
    nameController.text = "";
    authorController.text = "";
    costController.text = "";
    editionController.text = "";
    publicationController.text = "";
  }

  selectImage() async {
    File? temp = await pickImage();
    if (temp != null) {
      image = temp;
      update();
    } else {
      // TODO : User doesn't pick the image
      showSnackBar("Error:", "Image was not picked");
    }
  }
}
