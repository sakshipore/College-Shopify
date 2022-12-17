import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Stationary mongoDBModelfromJson(String str) =>
    Stationary.fromJson(json.decode(str));

String mongoDBModeltoJson(Stationary data) => json.encode(data.toJson());

class Stationary {
  ObjectId id;
  String item;
  String cost;
  ObjectId userId;
  String productImage;

  Stationary({
    required this.id,
    required this.item,
    required this.cost,
    required this.userId,
    required this.productImage,
  });

  factory Stationary.fromJson(Map<String, dynamic> json) => Stationary(
        id: json["id"],
        item: json["item"],
        cost: json["cost"],
        userId: json["userId"],
        productImage: json["productImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "item": item,
        "cost": cost,
        "userId": userId,
        "productImage": productImage,
      };
}
