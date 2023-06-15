import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE38800),
          title: Text("Profile"),
          actions: [
            IconButton(onPressed: () {
              FireBaseHelper.fireBaseHelper.logut();
              Get.offAndToNamed('/');
            }, icon: Icon(Icons.logout_sharp))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: CircleAvatar(backgroundImage: AssetImage("assets/images/logo.png",),backgroundColor: Color(0xffE38800),radius: 100,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
