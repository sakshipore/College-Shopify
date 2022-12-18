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

// showSnackBar(BuildContext context, String text) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       backgroundColor: Color(0xff2140B1),
//       content: Text(
//         text,
//         style: MyTextStyle.normalLatoFont.copyWith(
//           fontSize: 12.sp,
//           color: Colors.white,
//           fontWeight: FontWeight.w300,
//         ),
//       ),
//     ),
//   );
// }
