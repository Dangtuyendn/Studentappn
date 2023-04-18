import 'package:flutter/material.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:get/get.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/text_widget.dart';

class DetailInformation extends StatelessWidget {
  int index;

  DetailInformation({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    // int indexStudent;
    return Scaffold(
        appBar: AppBar(
          title: const Text('detail_infomation'),
        ),
        body: Stack(
          children: [
            const BackGround(Image: 'assets/images/backgroundgradient.jpg'),
            Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.amberAccent,
                            child: CircleAvatar(
                              radius: 48,
                              child: ClipOval(
                                child: Image(
                                    image: AssetImage('assets/icons/me.png')),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            controller.newStudent.value[index].name!,
                            style: const TextStyle(fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 23, bottom: 23),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DETAIL INFOMATION ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  informationWidget(
                      label: 'Name',
                      content: controller.newStudent.value[index].name!),
                  const Divider(
                    color: Colors.black,
                  ),
                  informationWidget(
                      label: 'ClassRoom',
                      content: controller.newStudent.value[index].classroom),
                  const Divider(
                    color: Colors.black,
                  ),
                  informationWidget(
                      label: 'Address',
                      content: controller.newStudent.value[index].address),
                  const Divider(
                    color: Colors.black,
                  ),
                  informationWidget(
                      label: 'Gender',
                      content:
                          (controller.newStudent.value[index].selectedGender)
                              .toString()),
                  const Divider(
                    color: Colors.black,
                  ),
                  // informationWidget(
                  //     label: 'Nation', content: controller.selectOptionList.value)
                  informationWidget(
                      label: 'Nation',
                      content:
                          (controller.newStudent.value[index].selectOptionList)
                              .toString())
                ],
              ),
            ),
          ],
        ));
  }
}
