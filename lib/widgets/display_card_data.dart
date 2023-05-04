import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardData extends StatelessWidget {
  User data;
  DisplayCardData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.h,
        ),
        Text(
          "User id: " + data.id.$oid,
          style: MyTextStyle.normalLatoFont,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Name: " + data.fname + " " + data.lname,
          style: MyTextStyle.normalLatoFont,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Address: " + data.address,
          style: MyTextStyle.normalLatoFont,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Mobile no.: " + data.mobNo,
          style: MyTextStyle.normalLatoFont,
        ),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
