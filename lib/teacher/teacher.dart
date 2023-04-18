import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teacher {
  final int? index;
  String? name;
  String? age;
  String? gender;
  String? address;

  Teacher(
      {@required this.index,
      @required this.name,
      @required this.age,
      @required this.gender,
      @required this.address});
}
