import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayCardProfile extends StatefulWidget {
  var userId;
  DisplayCardProfile({super.key, required this.userId});

  @override
  State<DisplayCardProfile> createState() => _DisplayCardProfileState();
}

class _DisplayCardProfileState extends State<DisplayCardProfile> {
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
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "User id: " + controller.data!.id.toString(),
                    style: MyTextStyle.normalLatoFont,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Name: " +
                        controller.data!.fname +
                        " " +
                        controller.data!.lname,
                    style: MyTextStyle.normalLatoFont,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Address: " + controller.data!.address,
                    style: MyTextStyle.normalLatoFont,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Mobile no.: " + controller.data!.mobNo,
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
                    itemCount: controller.data!.product.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 10.h,
                        width: 10.h,
                        color: Colors.black,
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
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 10.h,
                        width: 10.h,
                        color: Colors.black,
                      );
                    },
                  ),
                ],
              );
      },
    );
  }
}
