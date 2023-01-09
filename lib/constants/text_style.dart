import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyle {
  static const String latoFont = "Lato";

  static TextStyle get normalLatoFont => TextStyle(
        fontFamily: latoFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xff222222),
      );

  static TextStyle get whiteLatoFont => TextStyle(
        fontFamily: latoFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );

  static TextStyle get headingLatoFont => TextStyle(
        fontFamily: latoFont,
        fontSize: 40.sp,
        color: Color(0xff222222),
        fontWeight: FontWeight.w900,
      );
}
