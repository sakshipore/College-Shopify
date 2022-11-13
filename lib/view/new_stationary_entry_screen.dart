import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewStationaryEntryScreen extends StatefulWidget {
  const NewStationaryEntryScreen({super.key});

  @override
  State<NewStationaryEntryScreen> createState() =>
      _NewStationaryEntryScreenState();
}

class _NewStationaryEntryScreenState extends State<NewStationaryEntryScreen> {
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
                headingText(text: "Stationary"),
                SizedBox(
                  height: 75.h,
                ),
                FormText(text: "Item Name"),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Cost"),
                SizedBox(
                  height: 30.h,
                ),
                Button(
                  text: "ADD STATIONARY",
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
