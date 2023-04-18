import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:studentappn/slider_bar/info_silebar.dart';
import 'package:studentappn/slider_bar/menubar.dart';
import 'package:studentappn/helper/icon_helper.dart';

class SlideBarMenu extends StatelessWidget {
  const SlideBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color.fromARGB(255, 6, 59, 102),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InfoSlideBar(name: 'Tuyen', proession: 'Admin'),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Browser',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MenuBar(name: 'Home', icon: IconHelper.home),
            MenuBar(name: 'Search', icon: IconHelper.search)
          ],
        ),
      ),
    );
  }
}
