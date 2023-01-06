import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Product mongoDBModelfromJson(String str) => Product.fromJson(json.decode(str));

String mongoDBModelFromJson(Product data) => json.encode(data.toJson());

class Product {
  ObjectId productId;
  String productName;
  String productCost;
  String productSpecification;
  ObjectId userId;
  String productImage;

  Product({
    required this.productId,
    required this.productName,
    required this.productCost,
    required this.productSpecification,
    required this.userId,
    required this.productImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        productName: json["productName"],
        productCost: json["productCost"],
        productSpecification: json["productSpecification"],
        userId: json["userId"],
        productImage: json["productImage"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productCost": productCost,
        "productSpecification": productSpecification,
        "userId": userId,
        "productImage": productImage,
      };
}
