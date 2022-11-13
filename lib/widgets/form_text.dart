import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormText extends StatelessWidget {
  final String text;
  FormText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: MyTextStyle.normalLatoFont.copyWith(
          fontSize: 14.sp,
          color: Color(0xff9B9B9B),
          fontWeight: FontWeight.w400,
        ),
        labelText: text,
        labelStyle: MyTextStyle.normalLatoFont.copyWith(
          fontSize: 11.sp,
          color: Color(0xff9B9B9B),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
