import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/controller/list_controller.dart';
import 'package:studentappn/signup.dart';
import 'package:studentappn/widget/submit_button.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/textfield_widget.dart';
import 'package:studentappn/controller/login_controller.dart';
import 'package:studentappn/widget/circleavatar_widget.dart';
import 'package:studentappn/widget/textfield_widget_passord.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  LoginController controller = Get.find();
  ListController listController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackGround(Image: 'assets/images/login.png'),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.2, left: 30),
          child: const Text(
            'Welcome',
            style: TextStyle(fontSize: 25),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 30,
                right: 30),
            child: Column(
              children: [
                //email
                TextFieldWidget(
                    textcontroller: controller.firstEmailEdittingController,
                    hintext: 'email',
                    labelText: "email"),
                const SizedBox(
                  height: 23,
                ),
                //password
                TextFieldWidgetPassword(
                    textcontroller: controller.firstPassWordEdittingController,
                    hintext: 'password',
                    labelText: 'password'),
                const SizedBox(
                  height: 23,
                ),
                SubmitButton(
                  onPressed: () => controller.loginEmail(),
                  title: 'Login',
                ),
                const SizedBox(
                  height: 23,
                ),
                // GestureDetector(
                //   onTap: () => {Get.to(const MyHomePage())},
                //   child: const ButtonWidget(
                //       backGroundColor: Colors.blue,
                //       text: 'Submit',
                //       textColor: Colors.white),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign',
                      style: TextStyle(fontSize: 23, color: Colors.blue),
                    ),
                    // CircleAvatar(
                    //     radius: 23,
                    //     backgroundColor: Colors.grey,
                    //     child: IconButton(
                    //         onPressed: () {
                    //           {
                    //             Get.to(Signup());
                    //           }
                    //         },
                    //         icon: const Icon(Icons.arrow_forward)))
                    CircleAvatarWidget(
                        onPressed: () {
                          Get.to(Signup());
                        },
                        icon: const Icon(Icons.arrow_forward))
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
