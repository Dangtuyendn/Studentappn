import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/subject/subject.dart';
import '../controller/list_controller.dart';

class ListSubject extends StatelessWidget {
  const ListSubject({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      body: Obx(() => ListView.builder(
          itemCount: controller.newSubject.length,
          itemBuilder: ((context, index) {
            Subject value = controller.newSubject[index] as Subject;
            return Obx(() => Column(
                  children: [
                    Text("Name  ${value.nameSJ!}",
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("Class: ${value.quaLity}",
                        style: const TextStyle(fontSize: 20)),
                  ],
                ));
          }))),
    );
  }
}
