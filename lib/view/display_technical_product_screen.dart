import 'package:college_shopify/controller/new_technical_entry_controller.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayTechnicalProductScreen extends StatefulWidget {
  var userID;
  DisplayTechnicalProductScreen({super.key, required this.userID});

  @override
  State<DisplayTechnicalProductScreen> createState() =>
      _DisplayTechnicalProductScreenState();
}

class _DisplayTechnicalProductScreenState
    extends State<DisplayTechnicalProductScreen> {
  final NewTechnicalEntryController technicalEntryController =
      Get.put(NewTechnicalEntryController());

  @override
  void initState() {
    technicalEntryController.displayData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewTechnicalEntryController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    headingText(text: "Product Details"),
                    Container(
                      child: controller.isDisplayLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: controller.result.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Product data = Product.fromJson(
                                  controller.result[index],
                                );
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => DisplayData(
                                        userId: data.userId,
                                        productId: data.productId,
                                      ),
                                    );
                                  },
                                  child: DisplayCardProduct(
                                    data: data,
                                  ),
                                );
                              },
                            ),
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
