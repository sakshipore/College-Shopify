import 'package:college_shopify/controller/new_book_entry_controller.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayBookProductScreen extends StatefulWidget {
  var userID;
  DisplayBookProductScreen({super.key, required this.userID});

  @override
  State<DisplayBookProductScreen> createState() =>
      _DisplayBookProductScreenState();
}

class _DisplayBookProductScreenState extends State<DisplayBookProductScreen> {
  final NewBookEntryController bookEntryController =
      Get.put(NewBookEntryController());

  @override
  void initState() {
    bookEntryController.displayData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewBookEntryController>(
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
                                        userId: widget.userID,
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
