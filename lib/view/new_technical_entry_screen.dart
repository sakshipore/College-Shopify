import 'dart:developer';

import 'package:college_shopify/db_helper/mongodb.dart';
import 'package:college_shopify/db_helper/mongodb_technical.dart';
import 'package:college_shopify/model/technical.dart';
import 'package:college_shopify/view/home_screen.dart';
import 'package:college_shopify/widgets/button.dart';
import 'package:college_shopify/widgets/form_text.dart';
import 'package:college_shopify/widgets/heading_text.dart';
import 'package:college_shopify/widgets/snackbar_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class NewTechnicalEntryScreen extends StatefulWidget {
  var userId;
  NewTechnicalEntryScreen({super.key, required this.userId});

  @override
  State<NewTechnicalEntryScreen> createState() =>
      _NewTechnicalEntryScreenState();
}

class _NewTechnicalEntryScreenState extends State<NewTechnicalEntryScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController modelNoController = TextEditingController();
  TextEditingController specificationController = TextEditingController();
  TextEditingController billNoController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController costController = TextEditingController();
  bool isLoading = false;
  var _id;

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

  Future<void> _insertData(String name, String modelNo, String specification,
      String billNo, String companyName, String cost) async {
    setState(() {
      isLoading = true;
    });
    _id = M.ObjectId();
    final data = Technical(
      id: _id,
      name: name,
      modelNo: modelNo,
      specification: specification,
      billNo: billNo,
      companyName: companyName,
      cost: cost,
      userId: widget.userId,
    );
    Map<String, dynamic> result =
        await MongoDatabaseTechnical().insert(data.toJson());
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
    modelNoController.text = "";
    specificationController.text = "";
    billNoController.text = "";
    companyNameController.text = "";
    costController.text = "";
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
                      headingText(text: "Technical"),
                      SizedBox(
                        height: 75.h,
                      ),
                      FormText(text: "Item Name", controller: nameController),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                          text: "Company Name",
                          controller: companyNameController),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(text: "Model No", controller: modelNoController),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(
                          text: "Specification",
                          controller: specificationController),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(text: "Bill No", controller: billNoController),
                      SizedBox(
                        height: 10.h,
                      ),
                      FormText(text: "Cost", controller: costController),
                      SizedBox(
                        height: 30.h,
                      ),
                      Button(
                        text: "ADD TECHNICAL",
                        onTap: () async {
                          await _insertData(
                            nameController.text,
                            modelNoController.text,
                            specificationController.text,
                            billNoController.text,
                            companyNameController.text,
                            costController.text,
                          );
                          await _updateData(_id);
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
