import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/widget/multiselect_dropdown.dart';
import 'package:studentappn/widget/textfield_widget.dart';
import '../controller/list_controller.dart';
import '../widget/button.dart';
import 'package:studentappn/widget/gender_selection.dart';
import 'package:studentappn/widget/background.dart';

class InfomationInput extends StatelessWidget {
  const InfomationInput({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();

    TextEditingController nameEditingController = TextEditingController();
    TextEditingController classEditingController = TextEditingController();
    TextEditingController addressEditingController = TextEditingController();

    bool _checkinput() {
      if (controller.nameEditingController.text == '') {
        Get.snackbar('name', 'value name is empty');
        return false;

        //  else if (controller.classEditingController.text == '') {
        //   Get.snackbar('classroom', 'value classroom is empty');
        //   return false;
      } else if (controller.addressEditingController.text == '') {
        Get.snackbar('address', 'value address is empty');
        return false;
      } else {
        controller.addStudent(
            controller.selectedGender.value,
            // controller.selectOptionList.value,
            controller.selectOptionList,
            controller.nameEditingController.text,
            controller.classEditingController.text,
            controller.addressEditingController.text);
        // //
        // controller.selectedGender.value;
        // //
        // controller.selectOptionList.value;
        Get.toEnd(() => const InfomationInput());
        return true;
      }
    }

    AppBar(title: const Text('Nhập Thông Tin Học Sinh'));

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
                TextFieldWidget(
                    textcontroller: controller.classEditingController,
                    hintext: 'class',
                    labelText: "class"),
                // DropdownButton(items: , onChanged: ()=>{}),

                const SizedBox(
                  height: 5,
                ),
                //input address
                TextFieldWidget(
                  textcontroller: controller.addressEditingController,
                  hintext: 'address',
                  labelText: "address",
                  // maxLines: 3,
                ),

                // select button radio
                GenderSelection(),
                //
                const SizedBox(height: 5),
                //select dropdown
                MultiSelectDropDown(),
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
