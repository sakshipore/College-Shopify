import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/login_controller.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/view/signup_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController mobNoController = TextEditingController();
  // final userController = Get.put(LoginController());
  var userId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          body: controller.isLoading
              ? Column(
                  children: [
                    SizedBox(
                      height: 400.h,
                    ),
                    Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff2140B1),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        "Connecting to Database...",
                      ),
                    ),
                  ],
                )
              : SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text("Login", style: MyTextStyle.headingLatoFont),
                        SizedBox(
                          height: 75.h,
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
                          height: 16.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => SignUpScreen(),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 175.w),
                            child: Text(
                              "Don't have an account?",
                              style: MyTextStyle.normalLatoFont,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Button(
                          text: "LOGIN",
                          onTap: () async {
                            if (mobNoController.text.length == 10) {
                              var userData = await controller
                                  .checkUser(mobNoController.text);
                              if (userData == null) {
                                showSnackBar(
                                    "Error occurred", "User doesn't exist !");
                                Get.to(
                                  () => SignUpScreen(),
                                );
                              } else {
                                userId = userData['id'];
                                showSnackBar(
                                    "User exists: ", userId.toString());
                                Get.offAllNamed(
                                  RoutesNames.homeScreen,
                                  arguments: userId,
                                );
                              }
                            } else {
                              showSnackBar(
                                  "Error occurred", "Enter valid number");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
