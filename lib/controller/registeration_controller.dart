import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/utils/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:studentappn/myhome_page.dart';

class RegisterationController extends GetxController {
  TextEditingController firstNameEdittingController = TextEditingController();
  TextEditingController firstEmailEdittingController = TextEditingController();
  TextEditingController firstPassWordEdittingController =
      TextEditingController();
  //register
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> registerEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);
      Map body = {
        'name': firstNameEdittingController.text,
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
          firstNameEdittingController.clear();
          firstEmailEdittingController.clear();
          firstPassWordEdittingController.clear();
          Get.off(MyHomePage());

          //SignUP success in to SignIN
          // Get.to(Signin());
        } else {
          throw jsonDecode(response.body)["message"] ?? "Unknow Error Occured";
        }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknow Error Occured";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              children: [Text(e.toString())],
            );
          });
    }
  }
  //end register

}
