import 'package:college_shopify/router/routes_names.dart';
import 'package:college_shopify/view/display_data.dart';
import 'package:college_shopify/view/display_screen.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/view/login_screen.dart';
import 'package:college_shopify/view/signup_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.homeScreen,
      arguments: dynamic,
      page: () => HomeScreen(userId: Get.arguments),
    ),
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesNames.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RoutesNames.displayData,
      arguments: Map<String, dynamic>,
      page: () => DisplayData(
        userId: Get.arguments["userId"],
        productId: Get.arguments["productId"],
      ),
    ),
    GetPage(
      name: RoutesNames.displayProductsScreen,
      arguments: Map<String, dynamic>,
      page: () => DisplayScreen(
        userID: Get.arguments["userID"],
        collectionName: Get.arguments["collectionName"],
      ),
    ),
  ];
}
