import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleAvatarWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;
  const CircleAvatarWidget(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 23,
      backgroundColor: Colors.grey,
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
