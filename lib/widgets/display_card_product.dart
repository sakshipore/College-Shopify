import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardProduct extends StatelessWidget {
  final Product data;
  DisplayCardProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2140B1),
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Row(
          children: [
            Container(
              height: 100.h,
              width: 100.w,
              child: data.productImage != ""
                  ? Image.network(
                      data.productImage,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/book_product.jpg",
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name: " + data.productName,
                    style: MyTextStyle.whiteLatoFont,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Product Specification: " + data.productSpecification,
                    style: MyTextStyle.whiteLatoFont,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Product Cost: " + data.productCost,
                    style: MyTextStyle.whiteLatoFont,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
