import 'package:ecommerce/screens/home/controller/bottom_controller.dart';
import 'package:ecommerce/screens/homescreen/view/homescreen.dart';
import 'package:ecommerce/screens/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {

  BottomController controller = Get.put(BottomController());
  
  List screens = [HomeScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xffE38800),
          currentIndex: controller.index.value,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
                // color: Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(
                Icons.account_circle_outlined,
                // color: Colors.grey,
              ),
            ),
          ],
          onTap: (value) {
            setState(() {
              controller.index.value = value;
            });
          },
        ),
        body: screens[controller.index.value],
      ),
    );
  }
}
