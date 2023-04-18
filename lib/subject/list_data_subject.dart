import 'package:studentappn/classroom/detail_infomation_class.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/subject/subject.dart';
import 'package:studentappn/widget/button.dart';
import 'package:studentappn/widget/task_widget.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';
import 'package:studentappn/classroom/edit_infomation_class.dart';

class ListDataSubject extends StatelessWidget {
  const ListDataSubject({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    ListController controller = Get.find();
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.redAccent,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );

    return Scaffold(
        body: Stack(
      children: [
        const BackGround(Image: "assets/images/list.jpg"),
        Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CircleAvatarWidget(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              //hiển thị thông tin đã nhập
              Flexible(
                  child: ListView.builder(
                      itemCount: controller.newSubject.length,
                      itemBuilder: ((context, index) {
                        Subject value = controller.newSubject[index] as Subject;
                        //

                        return Dismissible(
                          background: leftEditIcon,
                          secondaryBackground: rightDeleteIcon,
                          onDismissed: (DismissDirection direction) {
                            controller.removeSubject(index);
                          },
                          confirmDismiss: (DismissDirection direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              //lua chon: xem / chinh sua
                              showBottomSheet(
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2e3253)
                                              .withOpacity(0.4),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      height: 500,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          //xem

                                          InkWell(
                                            onTap: () {
                                              Get.to(DetailInformationClass(
                                                index: index,
                                              ));
                                            },
                                            child: const ButtonWidget(
                                                backGroundColor: Colors.blue,
                                                text: 'View',
                                                textColor: Colors.white),
                                          ),

                                          //chinh sua
                                          InkWell(
                                            onTap: () {
                                              controller.newSubject.value[index]
                                                      .index ??
                                                  0;
                                              controller
                                                      .nameSubjectEditingController
                                                      .text =
                                                  controller.newSubject
                                                      .value[index].nameSJ!;
                                              controller
                                                      .qualitySubjectEdittingController
                                                      .text =
                                                  controller.newSubject
                                                      .value[index].quaLity;

                                              Get.to(EditInfomationclass(
                                                  indexn: controller.newClass
                                                          .value[index].index ??
                                                      0));
                                              Get.toEnd(() =>
                                                  const ListDataSubject());
                                            },
                                            child: const ButtonWidget(
                                                backGroundColor: Colors.blue,
                                                text: 'Edit',
                                                textColor: Colors.white),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                              return false;
                            } else {
                              return Future.delayed(
                                  const Duration(seconds: 1),
                                  () =>
                                      direction == DismissDirection.endToStart);
                            }
                          },
                          key: ObjectKey(index),
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 12),
                            child: TaskWidget(
                                // text: "Name: " + value.name!, color: Colors.blueGrey),
                                //text: "Name: " + value.name!,
                                text: "Name: " + value.nameSJ!,
                                color: Colors.blueGrey),
                          ),
                        );
                      })))
            ],
          ),
        ),
      ],
    ));
  }
}
