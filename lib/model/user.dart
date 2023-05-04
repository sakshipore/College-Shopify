import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

User mongoDBModelfromJson(String str) => User.fromJson(json.decode(str));

String mongoDBModeltoJson(User data) => json.encode(data.toJson());

class User {
  ObjectId id;
  String address;
  String fname;
  String lname;
  String mobNo;
  List product;
  List boughtProducts;

  User({
    required this.id,
    required this.address,
    required this.fname,
    required this.lname,
    required this.mobNo,
    required this.product,
    required this.boughtProducts,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        address: json["address"],
        fname: json["fname"],
        lname: json["lname"],
        mobNo: json["mobNo"],
        product: json["product"] ?? [],
        boughtProducts: json["boughtProducts"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "fname": fname,
        "lname": lname,
        "mobNo": mobNo,
        "product": product,
        "boughtProducts": boughtProducts,
      };
}
