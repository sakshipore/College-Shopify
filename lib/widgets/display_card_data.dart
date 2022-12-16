import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardData extends StatelessWidget {
  MongoDBModel data;
  DisplayCardData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100.h,
        ),
        headingText(text: "Seller Details"),
        SizedBox(
          height: 50.h,
        ),
        normalText(text: "User id: " + data.id.$oid),
        SizedBox(
          height: 10.h,
        ),
        normalText(text: "Name: " + data.fname + " " + data.lname),
        SizedBox(
          height: 10.h,
        ),
        normalText(text: "Address: " + data.address),
        SizedBox(
          height: 10.h,
        ),
        normalText(text: "Mobile no.: " + data.mobNo),
        SizedBox(
          height: 30.h,
        ),
        Button(
            text: "BUY PRODUCT",
            onTap: () {
              Navigator.pop(context);
            })
      ],
    );
  }
}
