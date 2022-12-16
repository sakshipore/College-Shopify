import 'package:college_shopify/model/technical.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayCardTechnical extends StatelessWidget {
  Technical data;
  DisplayCardTechnical({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2140B1),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            whiteText(text: "Product id: " + data.id.$oid),
            SizedBox(
              height: 5.h,
            ),
            whiteText(text: "Name of Product: " + data.name),
            SizedBox(
              height: 5.h,
            ),
            whiteText(text: "Company Name: " + data.companyName),
            SizedBox(
              height: 5.h,
            ),
            whiteText(text: "Model no.: " + data.modelNo),
            SizedBox(
              height: 5.h,
            ),
            whiteText(text: "Specification: " + data.specification),
            SizedBox(
              height: 5.h,
            ),
            whiteText(text: "Bill no.: " + data.billNo),
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
    );
  }
}
