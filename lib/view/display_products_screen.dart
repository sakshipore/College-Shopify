import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/view/display_book_product_screen.dart';
import 'package:college_shopify/view/display_stationary_product_screen.dart';
import 'package:college_shopify/view/display_technical_product_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayBookProductScreen(),
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
                        builder: (context) => DisplayStationaryProductScreen(),
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
                        builder: (context) => DisplayTechnicalProductScreen(),
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

  // TODO : U have already made same widget for this i.e. performCard
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
