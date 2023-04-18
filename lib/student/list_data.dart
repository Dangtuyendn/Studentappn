import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/student/student.dart';
import '../controller/list_controller.dart';

class ListData extends StatelessWidget {
  const ListData({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.newStudent.length,
          itemBuilder: ((context, index) {
            Student value = controller.newStudent[index] as Student;
            return Obx(() => Column(
                  children: [
                    Text("Name  ${value.name!}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("Class: ${value.classroom}",
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
