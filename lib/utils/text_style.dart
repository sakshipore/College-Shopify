import 'package:flutter/material.dart';

// TODO : This isn't should be in utils.dart It should be in constants.dart
class MyTextStyle {
  static const String latoFont = "Lato";

  static TextStyle get normalLatoFont => TextStyle(
        fontFamily: latoFont,
      );
}
