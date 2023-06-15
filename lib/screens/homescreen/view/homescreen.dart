import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/homescreen/controller/home_controller.dart';
import 'package:ecommerce/screens/homescreen/model/home_model.dart';
import 'package:ecommerce/utils/firebase_helper/firebase_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE38800),
          title: Text("Home"),
        ),
        body: StreamBuilder(
          stream: FireBaseHelper.fireBaseHelper.read(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              controller.productList.clear();

              for (var x in snapData!.docs) {
                Map? data = x.data() as Map;

                HomeModel m1 = HomeModel(
                    Price: data['price'],
                    Name: data['name'],
                    Category: data['category'],
                    Image: data['image'],
                    Description: data['description'],
                    key: x.id);

                controller.productList.add(m1);

                print(
                    "================================${data['name']} ${data['price']} ${data['category']} ${data['image']}");
              }
              return ListView.builder(

                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.toNamed('/details',arguments: controller.productList[index]),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.orange.shade100, blurRadius: 1, spreadRadius: 1,),
                          BoxShadow(color: Colors.orange.shade100, blurRadius: 3, spreadRadius: 3,)
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Image.network("${controller.productList[index].Image}"),
                          ),
                          ListTile(
                            // leading: CircleAvatar(
                            //   backgroundImage: NetworkImage(
                            //       "${controller.productList[index].Image
                            //       }"),
                            // ),

                            title: Text("${controller.productList[index].Name}"),
                            subtitle: Text("₹ ${controller.productList[index].Price}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    HomeModel h1 = HomeModel(
                                      Category: controller.productList[index].Category,
                                      Name: controller.productList[index].Name,
                                      Price: controller.productList[index].Price,
                                      Image: controller.productList[index].Image,
                                      key: controller.productList[index].key,
                                    );
                                    Get.toNamed('/edit', arguments: h1);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    FireBaseHelper.fireBaseHelper.delete(
                                      key: controller.productList[index].key,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xffE38800),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/input');
            },
            backgroundColor: Color(0xffE38800),
            child: Icon(
              Icons.add_outlined,
              size: 30,
            )),
      ),
    );
  }
}
