import 'package:flutter/material.dart';
import 'package:gotech_app/page/app/cart/cart.dart';
import 'package:gotech_app/page/app/detail_product/detail_product.dart';
import 'package:gotech_app/page/app/home/home.dart';
import 'package:gotech_app/page/authentication/login.dart';

class RouteManager {
  static const String login = "login";
  static const String home = "home";
  static const String detailProduct = "detailProduct";
  static const String cart = "cart";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: ((context) => const Login()));
      case home:
        return MaterialPageRoute(builder: ((context) => const Home()));
      case detailProduct:
        DataSendDetailProduct id = settings.arguments as DataSendDetailProduct;
        return MaterialPageRoute(
            builder: ((context) => DetailProduct(
                  id: id.id ?? "",
                  callBack: id.callBack,
                )));
      case cart:
        return MaterialPageRoute(builder: ((context) => Cart()));
      default:
        return MaterialPageRoute(
            builder: ((context) => const Scaffold(
                  body: Center(child: Text("The route name is not exist")),
                )));
    }
  }
}
