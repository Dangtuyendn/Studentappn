import 'package:flutter/material.dart';

class InfoSlideBar extends StatelessWidget {
  final String name, proession;

  const InfoSlideBar({super.key, required this.name, required this.proession});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage('assets/icons/me.png'),
              fit: BoxFit.fill,
            ),
          )),
      title: Text(name),
      subtitle: Text(proession),
    );
  }
}
