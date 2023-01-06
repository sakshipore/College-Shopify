import 'dart:developer';

import 'package:college_shopify/view/new_product_entry_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  var userId;
  ProductsScreen({super.key, required this.userId});

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
                  text: "Product",
                  image: "assets/images/book_product.jpg",
                  height: 150,
                  onTap: () {
                    log("IN PRODUCT SCREEN : $userId");
                    Get.to(
                      () => NewProductEntryScreen(userId: userId),
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
