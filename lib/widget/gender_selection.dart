import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/controller/list_controller.dart';

class GenderSelection extends StatelessWidget {
  ListController selectedGender = Get.find();
  GenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(left: 23, right: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                  child: Text(
                'Gender',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
              Row(
                children: [
                  //radio button "male"
                  Radio(
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      selectedGender.onChangeGender(value);
                    },
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.all(Colors.blue),
                  ),

                  const Text(
                    'Male',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      selectedGender.onChangeGender(value);
                      
                    },
                  
                    activeColor: Colors.blue,
                    fillColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
