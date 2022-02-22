import 'package:flutter/cupertino.dart';

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.suffixImg,
    required this.iconBgColor,
  }) : super(key: key);

  final String suffixImg;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(this.suffixImg, fit: BoxFit.contain),
        padding: const EdgeInsets.all(9),
        margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: iconBgColor),
        width: 35);
  }
}
