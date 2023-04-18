import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentappn/classroom/classroom.dart';
import 'package:studentappn/student/student.dart';
import 'package:studentappn/subject/subject.dart';
import 'package:studentappn/teacher/teacher.dart';

class ListController extends GetxController {
  //Sinh Viên
  var newStudent = [].obs;
  //Lớp Học
  var newClass = [].obs;
  //Subject
  var newSubject = [].obs;
//Teacher
  var newTeacher = [].obs;

//khai báo cho dropdownbutton
  //  var selectOptionList = "".obs;
  String selectOptionList = "";
  List dropDown = ['Kinh', 'Khác'].obs;
  // List dropDown = ['Kinh', 'Khác'];
  onChangeDropdown(var nation) {
    // selectOptionList.value = nation;
    selectOptionList = nation;
    print('dân tộc là ' + nation);
  }

  //khai báo dropdown gender
  var selectDropDownGender = "".obs;
  List dropDownGender = []..length;

  //c1 lấy giá trị giới tính được chọn
  var selectedGender = "".obs;
  onChangeGender(var gender) {
    selectedGender.value = gender;
    print('Giới tính là ' + gender);
  }

  //c2
  String _orderType = '_trai';
  String get orderType => _orderType;
  void setOrderType(String type) {
    _orderType = type;
    update();
    print('Gioi tinh là ' + orderType);
  }

  TextEditingController nameEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();

  TextEditingController classEditingController = TextEditingController();
  //
  TextEditingController nameClassEditingController = TextEditingController();
  TextEditingController teacherEdittingController = TextEditingController();

  TextEditingController nameSubjectEditingController = TextEditingController();
  TextEditingController qualitySubjectEdittingController =
      TextEditingController();
  TextEditingController ageEdittingController = TextEditingController();
  late Student student;
  late Classroom classroom;
  late Subject subject;
  late Teacher teacher;
  var itemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onclose() {
    super.onClose();
    nameEditingController.dispose();
    addressEditingController.dispose();
    classEditingController.dispose();
    nameClassEditingController.dispose();
    teacherEdittingController.dispose();
    nameSubjectEditingController.dispose();
    qualitySubjectEdittingController.dispose();
    ageEdittingController.dispose();
  }

  //Func ADD Student
  addStudent(var selectedGender, var selectOptionList, String name,
      String address, String classroom) {
    Student student = Student(
        index: newStudent.length + 1,
        name: name,
        address: address,
        classroom: classroom,
        selectedGender: selectedGender,
        selectOptionList: selectOptionList);
    newStudent.add(student);
    print('đã thêm');
    // itemCount.value = newStudent.value.length;
    nameEditingController.clear();
    classEditingController.clear();
    addressEditingController.clear();
  }

  ////Func ADD classroom
  addClassroom(String classname, String teacher) {
    Classroom classroom = Classroom(
      index: newClass.length + 1,
      classname: classname,
      teacher: teacher,
    );
    newClass.add(classroom);
    print('đã thêm');
    nameClassEditingController.clear();
    teacherEdittingController.clear();
  }

  //CLEAR student
  removeStudent(int index) {
    var i = 0;
    if (newStudent[i] != 0 && newStudent.length > index) {
      newStudent.removeAt(index);
    }
    update();
  }

//CLEAR classroom
  removeClass(int index) {
    var i = 0;
    if (newClass[i] != 0 && newClass.length > index) {
      newClass.removeAt(index);
    }
    update();
  }

//View Student
  viewStuden(int index, var selectedGender, var selectOptionList, String name,
      String classroom, String address) {
    for (var i = 0; i < newStudent.length; i++) {
      if (newStudent[i].index == index) {
        newStudent[i] = newStudent();
      }
    }
  }

  //View class
  viewSClass(
      int index, String classname, String teacher, String selectedGender) {
    for (var i = 0; i < newClass.length; i++) {
      if (newClass[i].index == index) {
        newClass[i] = newClass();
      }

      ;
    }
  }

//update || Edit student
  updateStuden(int index, var selectedGender, var selectOptionList, String name,
      String classroom, String address) {
    Student newData = Student(
        index: index,
        name: name,
        address: address,
        classroom: classroom,
        selectedGender: selectedGender,
        selectOptionList: selectOptionList);
    for (var i = 0; i < newStudent.length; i++) {
      if (newStudent[i].index == index) {
        newStudent[i] = newData;
      }
    }
    nameEditingController.clear();
    classEditingController.clear();
    addressEditingController.clear();
  }

  //update || Edit class
  updateClass(int index, String classname, String teacher) {
    Classroom newdataclass =
        Classroom(index: index, classname: classname, teacher: teacher);
    for (var i = 0; i < newClass.length; i++) {
      if (newClass[i].index == index) {
        newClass[i] = newdataclass;
      }
    }
    nameClassEditingController.clear();
    teacherEdittingController.clear();
  }

// Subject
  //add
  addSubject(String nameSJ, String quaLity) {
    Subject subject =
        Subject(index: newSubject.length + 1, nameSJ: nameSJ, quaLity: quaLity);
    newSubject.add(subject);
    nameSubjectEditingController.clear();
    qualitySubjectEdittingController.clear();
  }

  //clear
  removeSubject(int index) {
    var i = 0;
    if (newSubject[i] != 0 && newSubject.length > index) {
      newStudent.removeAt(index);
    }
    update();
  }

  //view Subject
  viewSubject(int index, String nameSJ, String quaLity) {
    for (var i = 0; i < newSubject.length; i++) {
      if (newSubject[i].index == index) {
        newSubject[i] = newSubject;
      }
    }
  }

  //update Subject
  updateSubject(int newIndex, String newNameSJ, String newQuality) {
    Subject newData =
        Subject(index: newIndex, nameSJ: newNameSJ, quaLity: newQuality);
    for (var i = 0; i < newSubject.length; i++) {
      if (newSubject[i].index == newIndex) {
        newSubject[i] = newData;
      }
    }
  }

  //Teacher
  //add
  addTeacher(String newName, String newAge, var newGender, String newaddress) {
    Teacher teacher = Teacher(
        index: newTeacher.length + 1,
        name: newName,
        age: newAge,
        gender: newGender,
        address: newaddress);
    newTeacher.add(teacher);
    print("Đã thêm");
    nameEditingController.clear();
    ageEdittingController.clear();
    addressEditingController.clear();
  }

//remove
  removeTeacher(int newIndex) {
    var i = 0;
    if (newTeacher[i] > 0 && newTeacher.length > newIndex) {
      newTeacher.removeAt(newIndex);
    }
    update();
  }

//view
  viewTeacher(int newIndex, String newName, String newAge, var newGender,
      String newAddress) {
    for (var i = 0; i < newTeacher.length; i++) {
      if (newTeacher[i].index == newIndex) {
        newTeacher[i] = newTeacher();
      }
    }
  }

  //edit
  updateTacher(int newIndex, String newName, String newAge, var newGender,
      String newAddress) {
    Teacher newDataTeacher = Teacher(
        index: newIndex,
        name: newName,
        age: newAge,
        gender: newGender,
        address: newAddress);
    for (var i = 0; i < newTeacher.length; i++) {
      if (newTeacher[i].index == newIndex) {
        newTeacher[i] = newDataTeacher;
      }
    }
    nameEditingController.clear();
    ageEdittingController.clear();
    addressEditingController.clear();
  }

  //
}
