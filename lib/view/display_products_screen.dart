import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/view/display_book_product_screen.dart';
import 'package:college_shopify/view/display_stationary_product_screen.dart';
import 'package:college_shopify/view/display_technical_product_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayProductsScreen extends StatefulWidget {
  const DisplayProductsScreen({super.key});

  @override
  State<DisplayProductsScreen> createState() => _DisplayProductsScreenState();
}

class _DisplayProductsScreenState extends State<DisplayProductsScreen> {
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
                HeadingText(text: "Products"),
                SizedBox(
                  height: 75.h,
                ),
                ProductCard(
                  text: "Books",
                  image: "assets/images/book_product.jpg",
                  height: 150,
                  onTap: () {
                    DisplayBookProductScreen();
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
                    DisplayStationaryProductScreen();
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
                    DisplayTechnicalProductScreen();
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
