import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/view/display_products_screen.dart';
import 'package:college_shopify/view/product_entry_screen.dart';
import 'package:college_shopify/view/profile_screen.dart';
import 'package:college_shopify/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  var userId;
  HomeScreen({super.key, required this.userId});

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
                Text("Home", style: MyTextStyle.headingLatoFont),
                SizedBox(
                  height: 75.h,
                ),
                ProductCard(
                  text: "Selling Product",
                  image: "assets/images/selling_product.png",
                  height: 200.h,
                  onTap: () {
                    Get.to(
                      () => ProductEntryScreen(userId: userId),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                ProductCard(
                  text: "Buying Product",
                  image: "assets/images/buying_product.jpg",
                  height: 200.h,
                  onTap: () {
                    Get.to(
                      () => DisplayProductsScreen(userId: userId),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                ProductCard(
                  text: "Profile",
                  image: "assets/images/buying_product.jpg",
                  height: 200.h,
                  onTap: () {
                    Get.to(
                      () => ProfileScreen(userId: userId),
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
