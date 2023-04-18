import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/widget/textfield_widget.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/widget/button.dart';
import 'package:studentappn/widget/background.dart';

class InfomationSubjectInput extends StatelessWidget {
  InfomationSubjectInput({super.key});
  ListController controller = Get.find();

  TextEditingController nameSubjectEditingController = TextEditingController();
  TextEditingController qualitySubjectEdittingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool _checkinput() {
      if (controller.nameSubjectEditingController.text == '') {
        Get.snackbar('name', 'value name is empty');
        return false;

        //  else if (controller.classEditingController.text == '') {
        //   Get.snackbar('classroom', 'value classroom is empty');
        //   return false;
      } else if (controller.qualitySubjectEdittingController.text == '') {
        Get.snackbar('address', 'value address is empty');
        return false;
      } else {
        controller.addSubject(controller.nameSubjectEditingController.text,
            controller.qualitySubjectEdittingController.text);
        Get.toEnd(() => InfomationSubjectInput());
        return true;
      }
    }
    AppBar(title: const Text('Infomation Input'));
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
                    textcontroller: controller.nameSubjectEditingController,
                    hintext: 'Subject Name',
                    labelText: "Subject Name"),

                const SizedBox(
                  height: 5,
                ),
                //input class
                TextFieldWidget(
                    textcontroller: controller.qualitySubjectEdittingController,
                    hintext: 'quality',
                    labelText: "quality"),

                const SizedBox(
                  height: 5,
                ),
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
