import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/controller/product_controller.dart';
import 'package:college_shopify/db_helper/constants.dart';
import 'package:college_shopify/model/products.dart';
import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/widgets/display_card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                child: controller.isDisplayLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff2140B1),
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          Text("All Products",
                              style: MyTextStyle.headingLatoFont),
                          SizedBox(
                            height: 50.h,
                          ),
                          ListView.builder(
                            itemCount: controller.result.length > 10
                                ? 10
                                : controller.result.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // TODO : Dont need to do this when list is of type List<Product>
                              Product data = Product.fromJson(
                                controller.result[index],
                              );
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RoutesNames.displayData,
                                    arguments: {
                                      "userId": data.userId,
                                      "productId": data.productId,
                                    },
                                  );
                                },
                                child: DisplayCardProduct(
                                  data: data,
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
