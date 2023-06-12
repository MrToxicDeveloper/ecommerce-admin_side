import 'package:ecommerce/screens/edit/model/edit_model.dart';
import 'package:ecommerce/screens/homescreen/model/home_model.dart';
import 'package:ecommerce/screens/input/model/input_model.dart';
import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtImg = TextEditingController();

  HomeModel h1 = Get.arguments;


  @override
  void initState() {
    super.initState();
    txtName = TextEditingController(text: "${h1.Name}");
    txtPrice = TextEditingController(text: "${h1.Price}");
    txtCategory = TextEditingController(text: "${h1.Category}");
   txtImg = TextEditingController(text: "${h1.Image}");
  }


  @override
  Widget build(BuildContext context) {

    String? key = h1.key;

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
          title: Text("Edit product"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
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
            ],
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
                EditModel m1 = EditModel(Category: txtCategory.text,Name: txtName.text,Price: txtPrice.text);

                FireBaseHelper.fireBaseHelper.update(key: key,m1: m1);
                Get.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Update ",
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
