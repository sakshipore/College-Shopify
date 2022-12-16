import 'dart:developer';

import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/db_helper/mongodb_technical.dart';
import 'package:college_shopify/model/technical.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_technical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayTechnicalProductScreen extends StatefulWidget {
  const DisplayTechnicalProductScreen({super.key});

  @override
  State<DisplayTechnicalProductScreen> createState() =>
      _DisplayTechnicalProductScreenState();
}

class _DisplayTechnicalProductScreenState
    extends State<DisplayTechnicalProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Text(
                  "Products Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FutureBuilder(
                  future: MongoDatabaseTechnical().getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasData) {
                        int totalData = snapshot.data.length;
                        log("Total Data: $totalData");
                        log(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DisplayData(
                                      userId: snapshot.data[index]["userId"],
                                    ),
                                  ),
                                );
                              },
                              child: DisplayCardTechnical(
                                data: Technical.fromJson(
                                  snapshot.data[index],
                                ),
                              ),
                            );
                          },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
