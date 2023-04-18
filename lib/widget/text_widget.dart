import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/widget/gender_selection.dart';

Widget informationWidget({@required label, @required content}) {
  ListController controller = Get.find();
  ListController selectedGender = Get.find();
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: Text(label)),
        Expanded(flex: 1, child: Text(content))
      ],
    ),
  );
}
