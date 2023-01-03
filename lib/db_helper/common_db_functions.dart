import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> updateData(var productId, var userId) async {
  Map<String, dynamic>? userData = await MongoDatabase.fetchUserData(userId);

  if (userData == null) return;
  List productIds = userData["product"];
  productIds.add(productId);
  var result = await MongoDatabase.update(userId, productIds);
  log(result.toString());

  if (result["Success"] == false) {
    showSnackBar("Error occurred", result["Msg"]);
  } else {
    showSnackBar("Updated ID: ", "$productId");
  }
}

Future<void> updateBoughtProducts(var productId, var userId) async {
  Map<String, dynamic>? userData = await MongoDatabase.fetchUserData(userId);

  if (userData == null) return;
  List productIds = userData["boughtProducts"];
  productIds.add(productId);
  var result = await MongoDatabase.update(userId, productIds);
  log(result.toString());

  if (result["Success"] == false) {
    showSnackBar("Error occurred", result["Msg"]);
  } else {
    showSnackBar("Updated ID: ", "$productId");
  }
}

Future<String> uploadProductImage(File? image, String name) async {
  Reference ref = FirebaseStorage.instance
      .ref()
      .child('productImages')
      .child(name + DateTime.now().toString());
  TaskSnapshot snapshot = await ref.putFile(image!);
  String imageDwnUrl = await snapshot.ref.getDownloadURL();
  return imageDwnUrl;
}
