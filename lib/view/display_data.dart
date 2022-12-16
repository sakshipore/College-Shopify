import 'dart:developer';

import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/display_card_data.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayData extends StatefulWidget {
  var userId;
  DisplayData({super.key, required this.userId});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: FutureBuilder(
          future: MongoDatabase.fetchUserData(widget.userId),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(0xff2140B1),
                ),
              );
            } else {
              if (snapshot.hasData) {
                log(snapshot.data.toString());
                return DisplayCardData(
                  data: MongoDBModel.fromJson(
                    snapshot.data,
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "No Data Available",
                    style: MyTextStyle.normalLatoFont.copyWith(
                      color: Color(0xff222222),
                      fontSize: 20.sp,
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
