import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Book mongoDBModelfromJson(String str) => Book.fromJson(json.decode(str));

String mongoDBModelFromJson(Book data) => json.encode(data.toJson());

class Book {
  ObjectId id;
  String name;
  String author;
  String cost;
  String edition;
  String publication;
  ObjectId userId;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.cost,
    required this.edition,
    required this.publication,
    required this.userId,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        name: json["name"],
        author: json["author"],
        cost: json["cost"],
        edition: json["edition"],
        publication: json["publication"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "author": author,
        "cost": cost,
        "edition": edition,
        "publication": publication,
        "userId": userId,
      };
}
