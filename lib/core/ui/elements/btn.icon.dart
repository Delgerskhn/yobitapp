import 'package:flutter/material.dart';

class BtnIcon extends StatelessWidget {
  BtnIcon(
      {Key? key,
      required this.suffixImg,
      required this.iconBgColor,
      this.onPress})
      : super(key: key);
  final VoidCallback? onPress;

  final String suffixImg;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: onPress,
        icon: ImageIcon(AssetImage(this.suffixImg)),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: iconBgColor),
    );
  }
}
