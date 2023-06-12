import 'package:ecommerce/screens/home/view/bottom_screen.dart';
import 'package:ecommerce/screens/input/view/input_screen.dart';
import 'package:ecommerce/screens/log/view/log_screen.dart';
import 'package:ecommerce/screens/log/view/signup_screen.dart';
import 'package:get/get.dart';

class Routes{
  static Routes routes = Routes._();
  Routes._();

  List<GetPage> routesList= [
    GetPage(name: '/', page: () => LogIn(),),
    GetPage(name: '/signup', page: () => SignUpScreen(),),
    GetPage(name: '/home', page: () => BottomScreen(),),
    GetPage(name: '/input', page: () => InputScreen(),),
  ];
}