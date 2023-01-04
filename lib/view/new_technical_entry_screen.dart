import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/controller/new_technical_entry_controller.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewTechnicalEntryScreen extends StatelessWidget {
  var userId;
  NewTechnicalEntryScreen({super.key, required this.userId});

  final NewTechnicalEntryController technicalEntryController =
      Get.put(NewTechnicalEntryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewTechnicalEntryController>(builder: (controller) {
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
                          height: 50.h,
                        ),
                        headingText(text: "Technical"),
                        SizedBox(
                          height: 75.h,
                        ),
                        FormText(
                          text: "Item Name",
                          controller: controller.nameController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormText(
                          text: "Company Name",
                          controller: controller.companyNameController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormText(
                          text: "Model No",
                          controller: controller.modelNoController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormText(
                          text: "Specification",
                          controller: controller.specificationController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormText(
                          text: "Bill No",
                          controller: controller.billNoController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        FormText(
                          text: "Cost",
                          controller: controller.costController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.selectImage();
                          },
                          child: Center(
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: controller.image == null
                                    ? Center(
                                        child: normalText(
                                          text: "Add Image",
                                        ),
                                      )
                                    : Image.file(
                                        File(controller.image!.path),
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Button(
                          text: "ADD TECHNICAL",
                          onTap: () {
                            log("BEFORE FUNCTION : $userId");
                            controller.insertData(userId);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
