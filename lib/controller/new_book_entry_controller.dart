import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/db_helper/mongodb_book.dart';
import 'package:college_shopify/model/books.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewBookEntryController extends GetxController {
  final Rx<List<Book>> book = Rx<List<Book>>([]);
  var _id;
  bool isLoading = false;

  // Future<void> updateData(var productId, var userId) async {
  //   Map<String, dynamic>? userData = await MongoDatabase.fetchUserData(userId);

  //   if (userData == null) return;
  //   List productIds = userData["product"];
  //   productIds.add(productId);
  //   var result = await MongoDatabase.update(userId, productIds);
  //   log(result.toString());
   
  //   if (result["Success"] == false) {
  //     showSnackBar("Error occurred", result["Msg"]);
  //   } else {
  //     showSnackBar("Updated ID:", "$productId");
  //   }
  // }

  Future<dynamic> insertData(String name, String author, String cost,
      String edition, String publication, String image, var userId) async {
    _id = M.ObjectId();
    final data = Book(
      id: _id,
      name: name,
      author: author,
      cost: cost,
      edition: edition,
      publication: publication,
      userId: userId,
      productImage: image,
    );
    Map<String, dynamic> result =
        await MongoDatabaseBook().insert(data.toJson());
    log(result.toString());
    if (result["Success"] == true) {
      showSnackBar("Inserted ID:", "${_id.$oid}");
      return _id;
    } else {
      showSnackBar("Error occurred", result["Msg"]);
    }
  }

  // Future<String> uploadProductImage(File? image, String name) async {
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child('productImages')
  //       .child(name + DateTime.now().toString());
  //   TaskSnapshot snapshot = await ref.putFile(image!);
  //   String imageDwnUrl = await snapshot.ref.getDownloadURL();
  //   return imageDwnUrl;
  // }

}
