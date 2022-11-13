import 'package:college_shopify/constants.dart/text_style.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              headingText(text: "Sign Up"),
              SizedBox(
                height: 75.h,
              ),
              FormText(text: "First Name"),
              SizedBox(
                height: 10.h,
              ),
              FormText(text: "Last Name"),
              SizedBox(
                height: 10.h,
              ),
              FormText(text: "Address"),
              SizedBox(
                height: 10.h,
              ),
              FormText(text: "Mobile No"),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 170.w),
                  child: normalText(text: "Already have an account?"),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Button(
                text: "SIGN UP",
                onTap: () {
                  // TODO : Aise navigate nahi hoga Navigator.push() likh
                  HomeScreen();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
