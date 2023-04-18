import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/teacher/infomation_input_teacher.dart';
import 'package:studentappn/teacher/view_teacher.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/button.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';

class MarkTab extends StatelessWidget {
  MarkTab({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
        body: Stack(
      children: [
        const BackGround(Image: 'assets/images/backgroundgradient.jpg'),
        //back
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
            //add
            GestureDetector(
              onTap: () => {
                // Get.to(const InfomationInputTeacher())
              },
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'ADD MARK',
                  textColor: Colors.white),
            ),
            //show in list classroom
            GestureDetector(
              onTap: () => {
                // Get.to(const ViewTeacher())
              },
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'STUDENT SHIP',
                  textColor: Colors.white),
            ),
            GestureDetector(
              onTap: () => {
                // Get.to(const ViewTeacher())
              },
              child: const ButtonWidget(
                  backGroundColor: Colors.blue,
                  text: 'STATUS SUBJECT',
                  textColor: Colors.white),
            )
          ],
        ),
      ],
    ));
  }
}
