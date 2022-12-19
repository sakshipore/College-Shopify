import 'dart:developer';

import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/controller/new_book_entry_controller.dart';
import 'package:college_shopify/db_helper/mongodb_book.dart';
import 'package:college_shopify/model/books.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_book.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayBookProductScreen extends StatefulWidget {
  const DisplayBookProductScreen({super.key});

  @override
  State<DisplayBookProductScreen> createState() =>
      _DisplayBookProductScreenState();
}

class _DisplayBookProductScreenState extends State<DisplayBookProductScreen> {
  
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
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: MongoDatabaseBook().getData(),
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
                              child: DisplayCardBook(
                                data: Book.fromJson(
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
