import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  final String name;
  final String icon;
  const MenuBar({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: Row(
        children: [
          Image(
            width: 23,
            height: 23,
            color: Colors.white,
            image: AssetImage(icon),
          ),
          const SizedBox(
            width: 23,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
