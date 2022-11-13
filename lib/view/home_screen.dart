import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/view/display_products_screen.dart';
import 'package:college_shopify/view/products_screen.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                HeadingText(text: "Home"),
                SizedBox(
                  height: 75.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(),
                      ),
                    );
                  },
                  child: performCard(
                      "Selling Product", "assets/images/selling_product.png"),
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DisplayProductsScreen(),
                      ),
                    );
                  },
                  child: performCard(
                      "Buying Product", "assets/images/buying_product.jpg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget performCard(String text, String image) {
    return Container(
      width: 350.w,
      height: 200.h,
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
            height: 200.h,
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
