import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/controller/list_controller.dart';

class MultiSelectDropDown extends StatelessWidget {
  ListController controller = Get.find();
  MultiSelectDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => DropdownButton(
            hint: const Text("Select"),
            isDense: true,
            // value: controller.selectOptionList.isEmpty
            //     ? null
            //     : controller.selectOptionList,

            // value: controller.selectOptionList,
            // value: controller.selectOptionList == null
            //     ? controller.selectOptionList
            //     : controller.newStudent.value,

            value: controller.selectOptionList == null
                ? controller.selectOptionList
                : controller.dropDown.first,
            isExpanded: true,
            onChanged: (data) {
              //  selectOptionList.onChangeDropdown(newvalue);
              controller.onChangeDropdown(data);
              controller.update();
            },
            items: [
              for (var newdata in controller.dropDown)
                DropdownMenuItem<String>(
                  child: Text(newdata),
                  value: newdata,
                )
            ],

            // onChanged: (newvalue) {
            //   //  selectOptionList.onChangeDropdown(newvalue);
            //   controller.onChangeDropdown(newvalue);

            // }
          )),
    );
  }
}
