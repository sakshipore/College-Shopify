import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SnackBarText extends StatelessWidget {
  String text;
  SnackBarText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Color(0xff2140B1),
      content: Text(
        text,
        style: MyTextStyle.normalLatoFont.copyWith(
          fontSize: 12.sp,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
