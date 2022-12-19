import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Color(0xff2140B1),
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
  );
}
