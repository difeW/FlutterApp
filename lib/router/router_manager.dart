import 'package:flutter/material.dart';
import 'package:gotech_app/page/app/detail_product/detail_product.dart';
import 'package:gotech_app/page/app/home/home.dart';
import 'package:gotech_app/page/authentication/login.dart';

class RouteManager {
  static const String login = "login";
  static const String home = "home";
  static const String detailProduct = "detailProduct";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: ((context) => const Login()));
      case home:
        return MaterialPageRoute(builder: ((context) => const Home()));
      case detailProduct:
        String id = settings.arguments as String;
        return MaterialPageRoute(builder: ((context) => DetailProduct(id: id)));
      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                  body: Center(child: Text("The route name is not exist")),
                )));
    }
  }
}
