import 'package:college_shopify/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NormalText extends StatelessWidget {
//   final String text;
//   NormalText({super.key, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: MyTextStyle.normalLatoFont.copyWith(
//         fontSize: 14.sp,
//         fontWeight: FontWeight.w400,
//         color: Color(0xff222222),
//       ),
//     );
//   }
// }

Text normalText({required String text}) {
  return Text(
    text,
    style: MyTextStyle.normalLatoFont.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xff222222),
    ),
  );
}

Text whiteText({required String text}) {
  return Text(
    text,
    style: MyTextStyle.normalLatoFont.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}
