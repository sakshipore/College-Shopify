import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/product_controller.dart';
import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsScreen extends StatefulWidget {
  var userID;
  AllProductsScreen({super.key, required this.userID});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final ProductEntryController productEntryController =
      Get.put(ProductEntryController());

  @override
  void initState() {
    productEntryController.displayData(ALLPRODUCTS_COLL);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductEntryController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("All Products", style: MyTextStyle.headingLatoFont),
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
                                    Get.to(() => DisplayData(
                                          userId: data.userId,
                                          productId: data.productId,
                                        ));
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
