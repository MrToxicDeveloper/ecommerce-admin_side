import 'dart:async';

import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed(FireBaseHelper.fireBaseHelper.checkLogin() == null
          ? "/signup"
          : "/home");
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/images/logo-01.png"),
        ),
      ),
    );
  }
}
