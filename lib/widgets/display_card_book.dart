import 'package:college_shopify/model/books.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardBook extends StatelessWidget {
  Book data;
  DisplayCardBook({super.key, required this.data});

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
                  whiteText(text: "Name of Book: " + data.name),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Author: " + data.author),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Edition: " + data.edition),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Publication: " + data.publication),
                  SizedBox(
                    height: 5.h,
                  ),
                  whiteText(text: "Cost: " + data.cost),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
