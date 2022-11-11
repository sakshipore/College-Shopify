import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  String text;
  Button({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 345.w,
      decoration: BoxDecoration(
        color: Color(0xff2140B1),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Center(
        child: Text(
          text,
          style: MyTextStyle.normalLatoFont.copyWith(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
