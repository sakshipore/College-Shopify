import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayProductsScreen extends StatelessWidget {
  var userId;
  DisplayProductsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text("Products", style: MyTextStyle.headingLatoFont),
                SizedBox(
                  height: 75.h,
                ),
                ProductCard(
                  text: "Books",
                  image: "assets/images/book_product.jpg",
                  height: 150,
                  onTap: () {
                    Get.toNamed(
                      RoutesNames.displayProductsScreen,
                      arguments: {
                        "userID": userId,
                        "collectionName": BOOK_COLL,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                ProductCard(
                  text: "Stationary",
                  image: "assets/images/stationary_product.jpg",
                  height: 150,
                  onTap: () {
                    Get.toNamed(
                      RoutesNames.displayProductsScreen,
                      arguments: {
                        "userID": userId,
                        "collectionName": STATIONARY_COLL,
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 25.h,
                ),
                ProductCard(
                  text: "Technical",
                  image: "assets/images/technical_product.jpg",
                  height: 150,
                  onTap: () {
                    Get.toNamed(
                      RoutesNames.displayProductsScreen,
                      arguments: {
                        "userID": userId,
                        "collectionName": TECHNICAL_COLL,
                      },
                    );
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
