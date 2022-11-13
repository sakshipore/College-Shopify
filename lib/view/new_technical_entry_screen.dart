import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
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
                FormText(text: "Item Name"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Company Name"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Model No"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Specification"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Bill No"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Cost"),
                SizedBox(
                  height: 30.h,
                ),
                Button(
                  text: "ADD TECHNICAL",
                  onTap: () {
                    HomeScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
