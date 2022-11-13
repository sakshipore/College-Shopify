import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewTechnicalEntryScreen extends StatefulWidget {
  const NewTechnicalEntryScreen({super.key});

  @override
  State<NewTechnicalEntryScreen> createState() =>
      _NewTechnicalEntryScreenState();
}

class _NewTechnicalEntryScreenState extends State<NewTechnicalEntryScreen> {
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
                HeadingText(text: "Technical"),
                SizedBox(
                  height: 75.h,
                ),
                formField("Item Name"),
                SizedBox(
                  height: 10.h,
                ),
                formField("Company Name"),
                SizedBox(
                  height: 10.h,
                ),
                formField("Model No"),
                SizedBox(
                  height: 10.h,
                ),
                formField("Specification"),
                SizedBox(
                  height: 10.h,
                ),
                formField("Bill No"),
                SizedBox(
                  height: 10.h,
                ),
                formField("Cost"),
                SizedBox(
                  height: 30.h,
                ),
                Button(text: "ADD TECHNICAL"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO : Exact same widget present in signup_screen.dart
  Widget formField(String field) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: field,
        hintStyle: MyTextStyle.normalLatoFont.copyWith(
          fontSize: 14.sp,
          color: Color(0xff9B9B9B),
          fontWeight: FontWeight.w400,
        ),
        labelText: field,
        labelStyle: MyTextStyle.normalLatoFont.copyWith(
          fontSize: 11.sp,
          color: Color(0xff9B9B9B),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
