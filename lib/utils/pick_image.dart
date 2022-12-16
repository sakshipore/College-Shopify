import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

File? productImage;

Future<File?> pickImage() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (image == null) 
    return null;

  final img = File(image.path);
  productImage = img;
  return productImage;
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
