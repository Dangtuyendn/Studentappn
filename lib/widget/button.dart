import 'package:flutter/cupertino.dart';

class ButtonWidget extends StatelessWidget {
  //viết các biến có trong button như kích cỡ, style, màu
  final Color backGroundColor;
  final String text;
  final Color textColor;

  const ButtonWidget(
      {required this.backGroundColor,
      required this.text,
      required this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 20, color: textColor)),
      ),
    );
  }
}
