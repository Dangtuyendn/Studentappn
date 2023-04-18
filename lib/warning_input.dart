import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message {
  static void inputWarning(String name, String errorwarning) {
    Get.snackbar(name, errorwarning,
        titleText: Text(
          name,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        messageText: Text(
          name,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.blue);
  }
}
