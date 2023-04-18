import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/student/infomation_input.dart';
import 'package:studentappn/student/view.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';

class StudentTab extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  StudentTab({super.key});
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
              icon: const Icon(Icons.arrow_back)),
          left: 12,
          top: 23,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Welcome
            // const Text('Welcome'),
            // TextButton(
            //     onPressed: () async {
            //       final SharedPreferences? prefs = await _prefs;
            //       print(prefs?.get('token'));
            //     },
            //     child: const Text('Print Token')),
            //add
            GestureDetector(
              onTap: () => {Get.to(const InfomationInput())},
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'Thêm mới Học Sinh',
                  textColor: Colors.white),
            ),
            //show in list classroom
            GestureDetector(
              onTap: () => {Get.to(const View())},
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'Hiển thị danh sách Học Sinh',
                  textColor: Colors.white),
            ),
          ],
        ),
      ],
    ));
  }
}
