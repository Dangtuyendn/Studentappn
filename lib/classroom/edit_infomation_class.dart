import 'package:studentappn/controller/list_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/gender_selection.dart';

class EditInfomationclass extends StatelessWidget {
  EditInfomationclass({super.key, required this.indexn});
  int indexn;
  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Infomation'),
        ),
        body: Stack(
          children: [
            const BackGround(Image: "assets/images/editdetailinfomation.jpg"),
            SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  //name
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'name'),
                    controller: controller.nameClassEditingController,
                  ),
                  //teacher
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'teacher'),
                    controller: controller.teacherEdittingController,
                  ),
                  InkWell(
                    onTap: () {
                      controller.updateClass(
                          indexn,
                          controller.nameClassEditingController.text,
                          controller.teacherEdittingController.text);
                      Get.back();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.blue),
                      child: const Center(
                        child: Text('Update'),
                      ),
                    ),
                  )
                ],
              ),
            )),
          ],
        ));
  }
}
