import 'dart:developer';

import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/db_helper/mongodb_stationary.dart';
import 'package:college_shopify/model/stationary.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_stationary.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayStationaryProductScreen extends StatefulWidget {
  const DisplayStationaryProductScreen({super.key});

  @override
  State<DisplayStationaryProductScreen> createState() =>
      _DisplayStationaryProductState();
}

class _DisplayStationaryProductState
    extends State<DisplayStationaryProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                headingText(text: "Product Details"),
                FutureBuilder(
                  future: MongoDatabaseStationary().getData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff2140B1),
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        int totalData = snapshot.data.length;
                        log("Total Data: $totalData");
                        log(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: snapshot.data.length,
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
                              child: DisplayCardStationary(
                                data: Stationary.fromJson(
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
