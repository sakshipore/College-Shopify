import 'package:college_shopify/constants/text_style.dart';
import 'package:college_shopify/view/all_products_screen.dart';
import 'package:college_shopify/view/display_products_screen.dart';
import 'package:college_shopify/view/product_entry_screen.dart';
import 'package:college_shopify/view/profile_screen.dart';
import 'package:flutter/material.dart';

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
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.sell_sharp,
              ),
              label: 'Sell Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Buy Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

