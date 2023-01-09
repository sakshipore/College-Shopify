import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/widgets/display_card_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  var userId;
  ProfileScreen({super.key, required this.userId});

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
                Text(
                  "Profile Screen",
                  style: MyTextStyle.headingLatoFont,
                ),
                SizedBox(
                  height: 75.h,
                ),
                DisplayCardProfile(
                  userId: userId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
