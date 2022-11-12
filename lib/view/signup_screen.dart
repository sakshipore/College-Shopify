import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
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
              HeadingText(
                text: "Sign Up",
              ),
              SizedBox(
                height: 75.h,
              ),
              formField("First Name"),
              SizedBox(
                height: 10.h,
              ),
              formField("Last Name"),
              SizedBox(
                height: 10.h,
              ),
              formField("Address"),
              SizedBox(
                height: 10.h,
              ),
              formField("Mobile No"),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 170.w),
                  child: NormalText(
                    text: "Already have an account?",
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Button(
                  text: "SIGN UP",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
