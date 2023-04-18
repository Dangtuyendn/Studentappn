import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/classroom/classroom_tab.dart';
import 'package:studentappn/mark/mark_tab.dart';
import 'package:studentappn/signin.dart';
import 'package:studentappn/subject/subject_tab.dart';
import 'package:studentappn/teacher/teacher_tab.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/student/student_tab.dart';
import 'controller/list_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentappn/widget/tab_widget.dart';

class MyHomePage extends StatelessWidget {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ListController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                final SharedPreferences? prefs = await _prefs;
                prefs?.clear();
                Get.offAll(Signin());
              },
              child: Row(
                children: const [
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 23, color: Colors.white),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.output,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
      body: Stack(
        children: [
          //background
          const BackGround(Image: 'assets/images/home.jpg'),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                //row1
                Row(children: [
                  TabWidget(
                    backgroundColor: Colors.yellow,
                    textColor: Colors.white,
                    title: 'Student',
                    textsize: 23,
                    onPressed: () => Get.to(StudentTab()),
                  ),
                  TabWidget(
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    title: 'Classroom',
                    textsize: 23,
                    onPressed: () => Get.to(ClassroomTab()),
                  ),
                ]),
                Row(
                  children: [
                    TabWidget(
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.white,
                      title: 'Subject',
                      textsize: 23,
                      onPressed: () => Get.to(SubjectTab()),
                    ),
                    TabWidget(
                      backgroundColor: Colors.brown,
                      textColor: Colors.white,
                      title: 'Teacher',
                      textsize: 23,
                      onPressed: () => Get.to(TeacherTab()),
                    )
                  ],
                ),
                Row(
                  children: [
                    TabWidget(
                        backgroundColor: Colors.orange,
                        textColor: Colors.white,
                        title: "Mark",
                        textsize: 23,
                        onPressed: () => Get.to(MarkTab()))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
