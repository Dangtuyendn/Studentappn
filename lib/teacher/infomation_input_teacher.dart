import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/widget/textfield_widget.dart';
import '../controller/list_controller.dart';
import '../widget/button.dart';
import 'package:studentappn/widget/gender_selection.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/textfield_number_widget.dart';

class InfomationInputTeacher extends StatelessWidget {
  const InfomationInputTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();

    TextEditingController nameEditingController = TextEditingController();
    TextEditingController ageEdittingController = TextEditingController();
    TextEditingController addressEditingController = TextEditingController();

    bool _checkinput() {
      if (controller.nameEditingController.text == '') {
        Get.snackbar('name', 'value name is empty');
        return false;

        //  else if (controller.classEditingController.text == '') {
        //   Get.snackbar('classroom', 'value classroom is empty');
        //   return false;
      } else if (controller.ageEdittingController.text == '') {
        Get.snackbar('age', 'value age is empty');
        return false;
      } else if (controller.addressEditingController.text == '') {
        Get.snackbar('address', 'address age is empty');
        return false;
      } else {
        controller.addTeacher(
            controller.nameEditingController.text,
            controller.ageEdittingController.text,
            controller.selectedGender.value,
            controller.addressEditingController.text);
        Get.toEnd(() => const InfomationInputTeacher());
        return true;
      }
    }

    AppBar(title: const Text('Teacher Infomation Input'));

    return Scaffold(
        body: Stack(
      children: [
        const BackGround(Image: "assets/images/backgroundstudent.jpg"),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 23, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //input name
                TextFieldWidget(
                    textcontroller: controller.nameEditingController,
                    hintext: 'name',
                    labelText: "name"),

                const SizedBox(
                  height: 5,
                ),
                //input class
                TextFieldNumberWidget(
                    textcontroller: controller.ageEdittingController,
                    hintext: "age",
                    labelText: "age"),
                const SizedBox(
                  height: 5,
                ),
                //gender
                GenderSelection(),
                //input address
                TextFieldWidget(
                  textcontroller: controller.addressEditingController,
                  hintext: 'address',
                  labelText: "address",
                  // maxLines: 3,
                ),
                const SizedBox(height: 5),
                //button Add
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //button ADD
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        _checkinput();
                      },
                      child: const ButtonWidget(
                          backGroundColor: Colors.blue,
                          text: 'ADD',
                          textColor: Colors.white),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    //button Home
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const ButtonWidget(
                        backGroundColor: Colors.blue,
                        text: 'Home',
                        textColor: Colors.white,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
