import 'package:college_shopify/view/new_book_entry_screen.dart';
import 'package:college_shopify/view/new_stationary_entry_screen.dart';
import 'package:college_shopify/view/new_technical_entry_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  var userId;
  ProductsScreen({super.key, required this.userId});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewBookEntryScreen(userId: widget.userId),
                      ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewStationaryEntryScreen(userId: widget.userId),
                      ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewTechnicalEntryScreen(userId: widget.userId),
                      ),
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
