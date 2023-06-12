import 'package:ecommerce/screens/edit/view/edit_screen.dart';
import 'package:ecommerce/screens/home/view/bottom_screen.dart';
import 'package:ecommerce/screens/input/view/input_screen.dart';
import 'package:ecommerce/screens/log/view/log_screen.dart';
import 'package:ecommerce/screens/log/view/signup_screen.dart';
import 'package:ecommerce/screens/profile/view/profile_screen.dart';
import 'package:ecommerce/screens/splesh/view/splesh_screen.dart';
import 'package:get/get.dart';

class Routes{
  static Routes routes = Routes._();
  Routes._();

  List<GetPage> routesList= [
    GetPage(name: '/', page: () => LogIn(),transition: Transition.fadeIn,transitionDuration: Duration(seconds: 1)),
    GetPage(name: '/signup', page: () => SignUpScreen(),),
    GetPage(name: '/home', page: () => BottomScreen(),),
    GetPage(name: '/home', page: () => ProfileScreen(),),
    GetPage(name: '/input', page: () => InputScreen(),),
    GetPage(name: '/edit', page: () => EditScreen(),),
    GetPage(name: '/splesh', page: () => SpleshScreen(),),
  ];
}