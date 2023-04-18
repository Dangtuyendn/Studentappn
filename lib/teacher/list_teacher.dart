import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/teacher/teacher.dart';
import '../controller/list_controller.dart';

class ListTeacher extends StatelessWidget {
  const ListTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.newTeacher.length,
          itemBuilder: ((context, index) {
            Teacher value = controller.newTeacher[index] as Teacher;
            return Obx(() => Column(
                  children: [
                    Text("Name  ${value.name!}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("Class: ${value.age}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("Address: ${value.address ?? ''}",
                        style: const TextStyle(fontSize: 20)),
                  ],
                ));
          }))),
    );
  }
}
