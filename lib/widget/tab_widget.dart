import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final int textsize;
  final VoidCallback onPressed;

  const TabWidget(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.title,
      required this.textsize,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12, top: 23, bottom: 23),
      width: 170,
      height: 120,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            // color: Colors.white.withOpacity(0.25),
            color: backgroundColor,
            offset: const Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1),
      ]),
      child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 23),
            ),
          )),
    );
  }
}
