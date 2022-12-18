import 'package:college_shopify/controller/login_controller.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  bool isLoading = false;
  var userId;
  bool inserted = false;

  // Future<bool> _insertData(
  //     String fname, String lname, String address, String mobNo) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   userId = M.ObjectId();
  //   final data = MongoDBModel(
  //     id: userId,
  //     address: address,
  //     fname: fname,
  //     lname: lname,
  //     mobNo: mobNo,
  //     product: [],
  //   );
  //   Map<String, dynamic> result = await MongoDatabase.insert(data);
  //   log(result.toString());
  //   setState(() {
  //     isLoading = false;
  //   });

  //   if (result["Success"] == true) {
  //     inserted = true;
  //     showSnackBar(context, "Inserted ID: ${userId.$oid}");
  //   } else {
  //     inserted = false;
  //     showSnackBar(context, result["Msg"]);
  //   }

  //   _clearAll();
  //   return inserted;
  // }

  // void _clearAll() {
  //   addressController.text = "";
  //   fnameController.text = "";
  //   lnameController.text = "";
  //   mobNoController.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(
      //           color: Color(0xff2140B1),
      //         ),
      //       )
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
                headingText(text: "Sign Up"),
                SizedBox(
                  height: 75.h,
                ),
                FormText(text: "First Name", controller: fnameController),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Last Name", controller: lnameController),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Address", controller: addressController),
                SizedBox(
                  height: 10.h,
                ),
                FormText(text: "Mobile No", controller: mobNoController),
                SizedBox(
                  height: 16.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
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
                  onTap: () async {
                    inserted = await LoginController.instance.insertData(
                      fnameController.text,
                      lnameController.text,
                      addressController.text,
                      mobNoController.text,
                    );
                    // await _insertData(
                    //   fnameController.text,
                    //   lnameController.text,
                    //   addressController.text,
                    //   mobNoController.text,
                    // );
                    if (inserted == true) {
                      Get.to(HomeScreen(userId: userId));
                    } else {
                      // normalText(text: "Error Occurred");
                      showSnackBar("Error occurred", "Kindly insert again");
                    }
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
