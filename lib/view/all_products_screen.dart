import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  var userId;
 AllProductsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("ALL PRODUCTS SCREEN"),
          ],
        ),
      ),
    );
  }
}
