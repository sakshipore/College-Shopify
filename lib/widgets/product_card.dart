import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String text;
  final String image;
  final double height;
  final VoidCallback onTap;
  ProductCard({
    super.key,
    required this.text,
    required this.image,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350.w,
        height: height.h,
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
                    style: MyTextStyle.normalLatoFont.copyWith(
                        fontSize: 30.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.clip),
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
      ),
    );
  }
}
