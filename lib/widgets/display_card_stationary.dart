import 'package:college_shopify/model/stationary.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardStationary extends StatelessWidget {
  Stationary data;
  DisplayCardStationary({super.key, required this.data});

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
                      "assets/images/stationary_product.jpg",
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
                  whiteText(text: "Name of Product: " + data.item),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Cost: " + data.cost),
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
