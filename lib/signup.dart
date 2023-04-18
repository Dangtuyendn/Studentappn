import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentappn/signin.dart';
import 'package:studentappn/widget/submit_button.dart';
import 'package:studentappn/widget/background.dart';
import 'package:studentappn/widget/textfield_widget.dart';
import 'package:studentappn/controller/registeration_controller.dart';
import 'package:studentappn/widget/textfield_widget_passord.dart';

class Signup extends StatelessWidget {
  RegisterationController controller = Get.find();
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(Image: 'assets/images/register.png'),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2, left: 30),
            child: const Text(
              'SignUp',
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
                  //name
                  TextFieldWidget(
                      textcontroller: controller.firstNameEdittingController,
                      hintext: 'name',
                      labelText: 'name'),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldWidget(
                      textcontroller: controller.firstEmailEdittingController,
                      hintext: 'email',
                      labelText: 'email'),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldWidgetPassword(
                      textcontroller:
                          controller.firstPassWordEdittingController,
                      hintext: 'password',
                      labelText: 'password'),
                  const SizedBox(
                    height: 23,
                  ),
                  SubmitButton(
                      onPressed: () => controller.registerEmail(),
                      title: 'signup'),
                  Row(
                    children: [
                      Text('SignIn'),
                      CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.grey,
                          child: IconButton(
                              onPressed: () {
                                {
                                  Get.to(Signin());
                                }
                              },
                              icon: const Icon(Icons.arrow_forward)))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
