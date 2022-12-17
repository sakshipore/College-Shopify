import 'dart:developer';
import 'dart:io';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/db_helper/mongodb_book.dart';
import 'package:college_shopify/model/books.dart';
import 'package:college_shopify/utils/pick_image.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/normal_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewBookEntryScreen extends StatefulWidget {
  var userId;
  NewBookEntryScreen({super.key, required this.userId});

  @override
  State<NewBookEntryScreen> createState() => _NewBookEntryScreenState();
}

class _NewBookEntryScreenState extends State<NewBookEntryScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  TextEditingController publicationController = TextEditingController();
  bool isLoading = false;
  var _id;
  String productImage = "";
  File? image;

  Future<void> _updateData(var productId) async {
    setState(() {
      isLoading = true;
    });
    Map<String, dynamic>? userData =
        await MongoDatabase.fetchUserData(widget.userId);

    if (userData == null) return;
    List productIds = userData["product"];
    productIds.add(productId);
    var result = await MongoDatabase.update(widget.userId, productIds);
    log(result.toString());
    setState(() {
      isLoading = false;
    });
    if (result["Success"] == false) {
      showSnackBar(context, result["Msg"]);
    } else {
      showSnackBar(context, "Updated ID: $productId");
    }
    _clearAll();
  }

  Future<void> _insertData(String name, String author, String cost,
      String edition, String publication, String image) async {
    setState(() {
      isLoading = true;
    });
    _id = M.ObjectId();
    final data = Book(
      id: _id,
      name: name,
      author: author,
      cost: cost,
      edition: edition,
      publication: publication,
      userId: widget.userId,
      productImage: image,
    );
    Map<String, dynamic> result =
        await MongoDatabaseBook().insert(data.toJson());
    log(result.toString());
    setState(() {
      isLoading = false;
    });
    if (result["Success"] == true) {
      showSnackBar(context, "Inserted ID: ${_id.$oid}");
    } else {
      showSnackBar(context, result["Msg"]);
    }
    _clearAll();
  }

  void _clearAll() {
    nameController.text = "";
    authorController.text = "";
    costController.text = "";
    editionController.text = "";
    publicationController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xff2140B1),
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      headingText(text: "Books"),
                      SizedBox(
                        height: 75.h,
                      ),
                      FormText(
                        text: "Book Name",
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                        text: "Author",
                        controller: authorController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                        text: "Edition",
                        controller: editionController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                        text: "Publication",
                        controller: publicationController,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                        text: "Cost",
                        controller: costController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: () async {
                          File? temp = await pickImage();
                          setState(() {
                            image = temp;
                          });
                        },
                        child: Center(
                          child: Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: image == null
                                  ? Center(child: normalText(text: "Add Image"))
                                  : Image.file(
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Button(
                        text: "ADD BOOK",
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          log("*************picking done uploading");
                          productImage = await uploadProductImage(
                              image, nameController.text);

                          await _insertData(
                            nameController.text,
                            authorController.text,
                            costController.text,
                            editionController.text,
                            publicationController.text,
                            productImage,
                          );
                          await _updateData(_id);
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeScreen(userId: widget.userId),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
