import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:gotech_app/modal/modal_authentication.dart';
import 'package:gotech_app/modal/modal_product_item.dart';
import 'package:http/http.dart' as http;

import 'api.dart';

class GotechRespontive {
  static Future<ModalAuthentication> fetchPostLogin(
      String username, String password) async {
    final res = await http
        .post(
      Uri.parse('${GotechApi.domain}/auth/signin'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'username': username, 'password': password}),
    )
        .timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408);
      },
    );

    if (res.statusCode == 201) {
      return ModalAuthentication.fromJson(jsonDecode(res.body));
    } else if (res.statusCode == 408) {
      return ModalAuthentication();
    } else {
      throw Exception('Failed to post data login.');
    }
  }

  static Future<List<ModalProductItem>> fetchGetListProductItemHotSale() async {
    final res = await http
        .get(Uri.parse(("${GotechApi.domain}/home/hotsale")))
        .timeout(const Duration(seconds: 5), onTimeout: () {
      return http.Response("Error", 408);
    });

    if (res.statusCode == 200) {
      List<ModalProductItem> result = [];
      List<dynamic> jsonList = jsonDecode(res.body);
      result = jsonList.map((e) => ModalProductItem.fromJson(e)).toList();
      return result;
    } else if (res.statusCode == 408) {
      return [];
    } else {
      throw ("fetch list hot sale get error");
    }
  }
}
