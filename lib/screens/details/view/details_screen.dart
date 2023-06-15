import 'package:ecommerce/screens/homescreen/controller/home_controller.dart';
import 'package:ecommerce/screens/homescreen/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  // const DetailsScreen({super.key});

  HomeController controller = Get.put(HomeController());
  HomeModel homeModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
          title: Text("${homeModel.Name}",style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Image.network("${homeModel.Image}"),
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 3, spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),
                        Text("₹ ${homeModel.Price}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                        SizedBox(height: 20,),
                        Text("${homeModel.Description}",style: TextStyle(fontSize: 17),),

                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
