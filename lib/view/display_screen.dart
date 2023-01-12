import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/product_controller.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisplayScreen extends StatefulWidget {
  var userID;
  String collectionName;
  DisplayScreen(
      {super.key, required this.userID, required this.collectionName});

  @override
  State<DisplayScreen> createState() => _DisplayBookProductScreenState();
}

class _DisplayBookProductScreenState extends State<DisplayScreen> {
  final ProductEntryController productController =
      Get.put(ProductEntryController());

  @override
  void initState() {
    productController.displayData(widget.collectionName, userId: widget.userID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductEntryController>(
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: controller.isDisplayLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff2140B1),
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Text("Product Details",
                              style: MyTextStyle.headingLatoFont),
                          ListView.builder(
                            itemCount: controller.result.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RoutesNames.displayData,
                                    arguments: {
                                      "userId": widget.userID,
                                      "productId":
                                          controller.result[index].productId,
                                    },
                                  );
                                },
                                child: DisplayCardProduct(
                                  data: controller.result[index],
                                ),
                              );
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
