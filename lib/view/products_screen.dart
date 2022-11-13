import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/view/new_book_entry_screen.dart';
import 'package:college_shopify/view/new_stationary_entry_screen.dart';
import 'package:college_shopify/view/new_technical_entry_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

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
                HeadingText(text: "Products"),
                SizedBox(
                  height: 75.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewBookEntryScreen(),
                      ),
                    );
                  },
                  child: productCard("Books", "assets/images/book_product.jpg"),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewStationaryEntryScreen(),
                      ),
                    );
                  },
                  child: productCard(
                      "Stationary", "assets/images/stationary_product.jpg"),
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewTechnicalEntryScreen(),
                      ),
                    );
                  },
                  child: productCard(
                      "Technical", "assets/images/technical_product.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget productCard(String text, String image) {
    return Container(
      width: 350.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: Color(0xff2140B1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Center(
              child: SizedBox(
                width: 150.w,
                child: Text(
                  text,
                  style: MyTextStyle.normalLatoFont
                      .copyWith(
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )
                      .copyWith(
                        overflow: TextOverflow.clip,
                      ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.h,
            width: 173.w,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}