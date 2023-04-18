import 'package:flutter/cupertino.dart';

class BackGround extends StatelessWidget {
  final String Image;

  const BackGround({
    super.key,
    required this.Image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Image), fit: BoxFit.cover)),
    );
  }
}
