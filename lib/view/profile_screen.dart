import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/profile_controller.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  var userId;
  ProfileScreen({super.key, required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    profileController.profileData(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff2140B1),
                ),
              )
            : Scaffold(
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User id: " + controller.user!.id.toString(),
                                style: MyTextStyle.normalLatoFont,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Name: " +
                                    controller.user!.fname +
                                    " " +
                                    controller.user!.lname,
                                style: MyTextStyle.normalLatoFont,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Address: " + controller.user!.address,
                                style: MyTextStyle.normalLatoFont,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Mobile no.: " + controller.user!.mobNo,
                                style: MyTextStyle.normalLatoFont,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Products uploaded: ",
                                style: MyTextStyle.normalLatoFont,
                              ),
                              ListView.builder(
                                itemCount: controller.uploadedProducts.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return DisplayCardProduct(
                                    data: controller.uploadedProducts[index],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Products bought: ",
                                style: MyTextStyle.normalLatoFont,
                              ),
                              ListView.builder(
                                itemCount: controller.boughtProducts.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return DisplayCardProduct(
                                    data: controller.boughtProducts[index],
                                  );
                                },
                              ),
                            ],
                          ),
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
