import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/classroom/infomationclass_input.dart';
import 'package:studentappn/classroom/listClass.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';

class ClassroomTab extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ClassroomTab({super.key});
  var isSelect = false.obs;

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
        body: Stack(
      children: [
        const BackGround(Image: 'assets/images/backgroundgradient.jpg'),
        Positioned(
          child: CircleAvatarWidget(
              onPressed: () {
                Get.back();
              },
              icon:Icon(Icons.arrow_back)),
          left: 12,
          top: 23,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => {Get.to(InfomationClassInput())},
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'Add ClassRoom',
                  textColor: Colors.white),
            ),
            //show in list classroom
            GestureDetector(
              onTap: () => {Get.to(const ListClass())},
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'List ClassRoom',
                  textColor: Colors.white),
            ),
          ],
        ),
      ],
    ));
  }
}
