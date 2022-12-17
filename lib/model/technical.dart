import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Technical mongoDBModelfromJson(String str) =>
    Technical.fromJson(json.decode(str));

String mongoDBModeltoJson(Technical data) => json.encode(data.toJson());

class Technical {
  ObjectId id;
  String name;
  String modelNo;
  String specification;
  String billNo;
  String companyName;
  String cost;
  ObjectId userId;
  String productImage;

  Technical({
    required this.id,
    required this.name,
    required this.modelNo,
    required this.specification,
    required this.billNo,
    required this.companyName,
    required this.cost,
    required this.userId,
    required this.productImage,
  });

  factory Technical.fromJson(Map<String, dynamic> json) => Technical(
        id: json["id"],
        name: json["name"],
        modelNo: json["modelNo"],
        specification: json["specification"],
        billNo: json["billNo"],
        companyName: json["companyName"],
        cost: json["cost"],
        userId: json["userId"],
        productImage: json["productImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "modelNo": modelNo,
        "specification": specification,
        "billNo": billNo,
        "companyName": companyName,
        "cost": cost,
        "userId": userId,
        "productImage":productImage,
      };
}
