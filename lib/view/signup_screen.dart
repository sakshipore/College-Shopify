import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/auth_controller.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final userController = Get.put(AuthController());
  var userId;
  bool inserted = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff2140B1),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Text(
                            "Sign Up",
                            style: MyTextStyle.headingLatoFont,
                          ),
                          SizedBox(
                            height: 75.h,
                          ),
                          FormText(
                              text: "First Name",
                              controller: controller.fnameController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                              text: "Last Name",
                              controller: controller.lnameController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                              text: "Address",
                              controller: controller.addressController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                            text: "Mobile No",
                            controller: controller.mobNoController,
                            onChanged: (value) {
                              if (value.length == 10) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 170.w),
                              child: Text(
                                "Already have an account?",
                                style: MyTextStyle.normalLatoFont,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Button(
                            text: "SIGN UP",
                            onTap: () async {
                              if (controller.mobNoController.text.length ==
                                      10 &&
                                  controller.fnameController.text != "" &&
                                  controller.lnameController.text != "" &&
                                  controller.addressController.text != "") {
                                await controller.insertData();
                              } else {
                                showSnackBar("Error occurred",
                                    "Enter valid credentials");
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
