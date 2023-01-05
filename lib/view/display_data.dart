import 'dart:developer';

import 'package:college_shopify/controller/login_controller.dart';
import 'package:college_shopify/controller/new_entry_controller.dart';
import 'package:college_shopify/model/mongodb_model.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/display_card_data.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayData extends StatefulWidget {
  var userId;
  var productId;
  DisplayData({super.key, required this.userId, required this.productId});

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  final NewEntryController newEntryController = Get.put(NewEntryController());

  @override
  void initState() {
    newEntryController.displayData(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewEntryController>(builder: (controller) {
      return Scaffold(
        body: (controller.isDisplayDataLoading ||
                controller.isboughtProductLoading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      headingText(text: "Seller Details"),
                      Container(
                        child: DisplayCardData(
                          data: MongoDBModel.fromJson(controller.result!),
                        ),
                      ),
                      Button(
                        text: "BUY PRODUCT",
                        onTap: () async {
                          log(widget.productId.toString());
                          await controller.boughtProducts(
                            widget.userId,
                            widget.productId,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }
}

// class DisplayData extends StatefulWidget {
//   var userId;
//   DisplayData({super.key, required this.userId});

//   @override
//   State<DisplayData> createState() => _DisplayDataState();
// }

// class _DisplayDataState extends State<DisplayData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(15.w),
//         child: FutureBuilder(
//           future: MongoDatabase.fetchUserData(widget.userId),
//           builder: (context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xff2140B1),
//                 ),
//               );
//             } else {
//               if (snapshot.hasData) {
//                 log(snapshot.data.toString());
//                 return DisplayCardData(
//                   data: MongoDBModel.fromJson(
//                     snapshot.data,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text(
//                     snapshot.error.toString(),
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: Text(
//                     "No Data Available",
//                     style: MyTextStyle.normalLatoFont.copyWith(
//                       color: Color(0xff222222),
//                       fontSize: 20.sp,
//                     ),
//                   ),
//                 );
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
