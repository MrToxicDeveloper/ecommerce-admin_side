import 'package:ecommerce/screens/input/model/input_model.dart';
import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtImg = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE38800),
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
          title: Text("Add product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                textField(controller: txtName, hint: "Enter name"),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: "Enter price"),
                ),
                SizedBox(
                  height: 10,
                ),
                textField(controller: txtCategory, hint: "Enter category"),
                SizedBox(
                  height: 10,
                ),
                textField(controller: txtImg, hint: "Enter image link"),
                SizedBox(height: 10,),

                TextField(
                  controller: txtDescription,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: "Enter description"),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 50,
            width: 100,
            child: FloatingActionButton(
              backgroundColor: Color(0xffE38800),
              shape: RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              heroTag: 'add',
              onPressed: () {
                InputModel m1 = InputModel(
                    Category: txtCategory.text,
                    Name: txtName.text,
                    Price: txtPrice.text,
                  Image: txtImg.text,
                    Description: txtDescription.text
                );
                FireBaseHelper.fireBaseHelper.create(m1);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Save ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.add)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({required controller, required hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
          hintText: "$hint"),
    );
  }
}
