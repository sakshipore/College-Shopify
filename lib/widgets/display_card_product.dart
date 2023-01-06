import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardProduct extends StatelessWidget {
  Product data;
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
                  // whiteText(text: "Product id: " + data.id.$oid),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  whiteText(text: "Product Name: " + data.productName),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Product Id: " + data.productId.toString()),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(
                      text: "Product Specification: " + data.productSpecification),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Product Cost: " + data.productCost),
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
