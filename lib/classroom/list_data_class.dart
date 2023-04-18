import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/classroom/classroom.dart';
import 'package:studentappn/controller/list_controller.dart';

class ListDataClass extends StatelessWidget {
  const ListDataClass({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.newClass.length,
          itemBuilder: ((context, index) {
            Classroom value = controller.newClass[index] as Classroom;
            return Obx(() => Column(
                  children: [
                    Text("Name" + value.classname!,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("Class: ${value.teacher}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    )
                  ],
                ));
          }))),
    );
  }
}
