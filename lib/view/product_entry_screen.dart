import 'dart:io';

import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/product_controller.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductEntryScreen extends StatefulWidget {
  var userId;
  ProductEntryScreen({super.key, required this.userId});

  @override
  State<ProductEntryScreen> createState() => _NewProductEntryScreenState();
}

class _NewProductEntryScreenState extends State<ProductEntryScreen> {
  @override
  void initState() {
    super.initState();
  }

  final ProductEntryController productEntryController =
      Get.put(ProductEntryController());

  // TODO : Shift to ProductEntryController
  final _productSizesList = ["Book", "Technical", "Stationary"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductEntryController>(
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
                          Text(
                            "Product",
                            style: MyTextStyle.headingLatoFont,
                          ),
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
                          // DropdownButton(
                          //   // value: _selectedValue,
                          //   value: controller.selectedValue,
                          //   items: _productSizesList
                          //       .map(
                          //         (e) => DropdownMenuItem(
                          //           child: Text(e),
                          //           value: e,
                          //         ),
                          //       )
                          //       .toList(),
                          //   onChanged: (value) {
                          //     // setState(() {
                          //     //   _selectedValue = value;
                          //     // });
                          //     controller.updateDropDown(value!);
                          //     // log(dropDownValue.toString());
                          //   },
                          // ),
                          SizedBox(
                            height: 45.h,
                            width: 330.w,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
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
                                value: controller.selectedValue,
                                hint: Text(
                                  "Select Product Type",
                                  style: MyTextStyle.normalLatoFont.copyWith(
                                    fontSize: 14.sp,
                                    color: Color(0xff9B9B9B),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
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
                                          child: Text(
                                            "Add Image",
                                            style: MyTextStyle.normalLatoFont,
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
