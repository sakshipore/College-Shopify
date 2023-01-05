import 'package:college_shopify/controller/profile_controller.dart';
import 'package:college_shopify/widgets/normal_text.dart';
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
    return GetBuilder<ProfileController>(builder: (controller) {
      return controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                normalText(text: "User id: " + controller.data!.id.toString()),
                SizedBox(
                  height: 10.h,
                ),
                normalText(
                    text: "Name: " +
                        controller.data!.fname +
                        " " +
                        controller.data!.lname),
                SizedBox(
                  height: 10.h,
                ),
                normalText(text: "Address: "+controller.data!.address),
                SizedBox(
                  height: 10.h,
                ),
                normalText(text: "Mobile no.: "+controller.data!.mobNo),
                SizedBox(
                  height: 10.h,
                ),
                normalText(text: "Products uploaded: "),
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
                normalText(text: "Products bought: "),
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
    });
  }
}
