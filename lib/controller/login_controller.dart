import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/myhome_page.dart';
import 'package:studentappn/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController firstEmailEdittingController = TextEditingController();
  TextEditingController firstPassWordEdittingController =
      TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> loginEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      Map body = {
        'email': firstEmailEdittingController.text.trim(),
        'password': firstPassWordEdittingController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          firstEmailEdittingController.clear();
          firstPassWordEdittingController.clear();
          // Get.off(MyHomePage());
          Get.off(MyHomePage());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)["message"];
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknow Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              children: [Text(error.toString())],
            );
          });
    }
  }
}
