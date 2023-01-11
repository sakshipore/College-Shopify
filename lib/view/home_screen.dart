import 'dart:developer';

import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/view/all_products_screen.dart';
import 'package:college_shopify/view/display_products_screen.dart';
import 'package:college_shopify/view/product_entry_screen.dart';
import 'package:college_shopify/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  var userId;
  HomeScreen({super.key, required this.userId});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List listOfPages;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    log("IN HOME SCREEN : " + widget.userId.toString());
    listOfPages = [
      AllProductsScreen(userID: widget.userId),
      ProductEntryScreen(userId: widget.userId),
      DisplayProductsScreen(userId: widget.userId),
      ProfileScreen(userId: widget.userId),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: listOfPages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff2140B1),
          elevation: 10,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedIconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.9),
          ),
          selectedItemColor: Colors.white.withOpacity(0.9),
          unselectedLabelStyle: MyTextStyle.whiteLatoFont,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25.h,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sell_sharp,
                size: 25.h,
              ),
              label: 'Sell Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: 25.h,
              ),
              label: 'Buy Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25.h,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   var userId;
//   HomeScreen({super.key, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 Text("Home", style: MyTextStyle.headingLatoFont),
//                 SizedBox(
//                   height: 75.h,
//                 ),
//                 ProductCard(
//                   text: "Selling Product",
//                   image: "assets/images/selling_product.png",
//                   height: 200.h,
//                   onTap: () {
//                     Get.to(
//                       () => ProductEntryScreen(userId: userId),
//                     );
//                   },
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 ProductCard(
//                   text: "Buying Product",
//                   image: "assets/images/buying_product.jpg",
//                   height: 200.h,
//                   onTap: () {
//                     Get.to(
//                       () => DisplayProductsScreen(userId: userId),
//                     );
//                   },
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 ProductCard(
//                   text: "Profile",
//                   image: "assets/images/buying_product.jpg",
//                   height: 200.h,
//                   onTap: () {
//                     Get.to(
//                       () => ProfileScreen(userId: userId),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
