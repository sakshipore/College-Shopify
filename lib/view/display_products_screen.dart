import 'package:college_shopify/view/display_book_product_screen.dart';
import 'package:college_shopify/view/display_stationary_product_screen.dart';
import 'package:college_shopify/view/display_technical_product_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
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
                headingText(text: "Products"),
                SizedBox(
                  height: 75.h,
                ),
                ProductCard(
                  text: "Books",
                  image: "assets/images/book_product.jpg",
                  height: 150,
                  onTap: () {
                    Get.to(
                      () => DisplayBookProductScreen(),
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
                    Get.to(
                      () => DisplayStationaryProductScreen(),
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
                    Get.to(
                      () => DisplayTechnicalProductScreen(),
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
