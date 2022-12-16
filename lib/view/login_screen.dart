import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/view/signup_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobNoController = TextEditingController();
  bool isLoading = true;
  var userId;

  void initState() {
    super.initState();
    connectToDB();
  }

  void connectToDB() async {
    MongoDatabase db = MongoDatabase();
    await db.connect();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
                    headingText(text: "Login"),
                    SizedBox(
                      height: 75.h,
                    ),
                    FormText(text: "Mobile No", controller: mobNoController),
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
                        child: normalText(text: "Don't have an account?"),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Button(
                      text: "LOGIN",
                      onTap: () async {
                        var userData =
                            await MongoDatabase.checkUser(mobNoController.text);

                        if (userData == null) {
                          showSnackBar(context, "User doesn't exist !");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        } else {
                          userId = userData['id'];
                          showSnackBar(
                              context, "User exists: " + userId.toString());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(userId: userId),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
