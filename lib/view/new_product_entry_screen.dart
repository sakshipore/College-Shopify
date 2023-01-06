import 'dart:io';

import 'package:college_shopify/controller/new_book_entry_controller.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewProductEntryScreen extends StatefulWidget {
  var userId;
  NewProductEntryScreen({super.key, required this.userId});

  @override
  State<NewProductEntryScreen> createState() => _NewProductEntryScreenState();
}

class _NewProductEntryScreenState extends State<NewProductEntryScreen> {
  @override
  void initState() {
    super.initState();
  }

  final NewBookEntryController bookEntryController =
      Get.put(NewBookEntryController());

  final _productSizesList = [
    "Select Product Type",
    "Book",
    "Technical",
    "Stationary"
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewBookEntryController>(
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
                            height: 50.h,
                          ),
                          headingText(text: "Product"),
                          SizedBox(
                            height: 75.h,
                          ),
                          FormText(
                            text: "Product Name",
                            controller: controller.productNameController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                            text: "Product Specification",
                            controller:
                                controller.productSpecificationController,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DropdownButton(
                            value: controller.selectedValue,
                            items: _productSizesList
                                .map(
                                  (e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.updateDropDown(value!);
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          FormText(
                            text: "Product Cost",
                            controller: controller.productCostController,
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
                                          child: normalText(text: "Add Image"))
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
                            text: "ADD PRODUCT",
                            onTap: () async {
                              await controller.insertData(widget.userId);
                            },
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
