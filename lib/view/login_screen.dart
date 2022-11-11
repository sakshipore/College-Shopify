import 'package:college_shopify/utils/text_style.dart';
import 'package:college_shopify/view/signup_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                text: "Login",
              ),
              SizedBox(
                height: 75.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Mobile No",
                  hintStyle: MyTextStyle.normalLatoFont.copyWith(
                    fontSize: 14.sp,
                    color: Color(0xff9B9B9B),
                    fontWeight: FontWeight.w400,
                  ),
                  labelText: "Mobile No",
                  labelStyle: MyTextStyle.normalLatoFont.copyWith(
                    fontSize: 14.sp,
                    color: Color(0xff9B9B9B),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 175.w),
                  child: NormalText(
                    text: "Don't have an account?",
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Button(
                text: "LOGIN",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
