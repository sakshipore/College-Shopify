import 'dart:developer';

import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/login_controller.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final userController = Get.put(LoginController());
  var userId;
  // TODO : Move to controller and make textEditingCotrollers final
  TextEditingController addressController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobNoController = TextEditingController();
  bool inserted = false;

  void _clearAll() {
    addressController.text = "";
    fnameController.text = "";
    lnameController.text = "";
    mobNoController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
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
                              text: "First Name", controller: fnameController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                              text: "Last Name", controller: lnameController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                              text: "Address", controller: addressController),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                            text: "Mobile No",
                            controller: mobNoController,
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
                              // TODO : Move all logic in controller
                              if (mobNoController.text.length == 10 &&
                                  fnameController.text != "" &&
                                  lnameController.text != "" &&
                                  addressController.text != "") {
                                inserted = await controller.insertData(
                                  fnameController.text,
                                  lnameController.text,
                                  addressController.text,
                                  mobNoController.text,
                                );
                                _clearAll();
                                if (inserted == true) {
                                  Get.offAllNamed(
                                    RoutesNames.homeScreen,
                                    arguments: userId,
                                  );
                                  log("USER ID AFTER SIGN UP: $userId");
                                } else {
                                  showSnackBar(
                                      "Error occurred", "Kindly insert again");
                                }
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
