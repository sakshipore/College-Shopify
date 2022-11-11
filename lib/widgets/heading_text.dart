import 'package:college_shopify/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  String text;
  HeadingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyTextStyle.normalLatoFont.copyWith(
        fontSize: 40.sp,
        color: Color(0xff222222),
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
