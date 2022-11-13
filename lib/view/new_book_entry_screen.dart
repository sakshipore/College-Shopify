import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewBookEntryScreen extends StatefulWidget {
  const NewBookEntryScreen({super.key});

  @override
  State<NewBookEntryScreen> createState() => _NewBookEntryScreenState();
}

class _NewBookEntryScreenState extends State<NewBookEntryScreen> {
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
                HeadingText(text: "Books"),
                SizedBox(
                  height: 75.h,
                ),
                FormText(text: "Book Name"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Author"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Edition"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Publication"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Cost"),
                SizedBox(
                  height: 30.h,
                ),
                Button(
                  text: "ADD BOOK",
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
