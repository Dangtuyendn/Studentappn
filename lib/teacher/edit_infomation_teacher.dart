import 'package:studentappn/controller/list_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/gender_selection.dart';
import 'package:studentappn/widget/textfield_number_widget.dart';

class EditInfomationTeacher extends StatelessWidget {
  EditInfomationTeacher({super.key, required this.indexEdit});
  int indexEdit;
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
                    controller: controller.nameEditingController,
                  ),
                  //address
                  TextFieldNumberWidget(
                      textcontroller: controller.ageEdittingController,
                      hintext: "age",
                      labelText: "age"),
                  //classroom
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'address'),
                    controller: controller.addressEditingController,
                  ),
                  //select gender
                  GenderSelection(),
                  InkWell(
                    onTap: () {
                      controller.updateTacher(
                          indexEdit,
                          controller.nameEditingController.text,
                          controller.ageEdittingController.text,
                          controller.selectedGender.value,
                          controller.addressEditingController.text);
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
