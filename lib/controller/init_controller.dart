import 'package:get/get.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/controller/registeration_controller.dart';
import 'package:studentappn/controller/login_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => ListController());
  Get.lazyPut(() => RegisterationController());
  Get.lazyPut(() => LoginController());
}
