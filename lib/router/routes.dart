import 'package:college_shopify/router/routes_names.dart';
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
  ];
}
