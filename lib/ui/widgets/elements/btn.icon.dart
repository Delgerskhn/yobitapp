import 'package:flutter/material.dart';

class BtnIcon extends StatelessWidget {
  const BtnIcon({
    Key? key,
    required this.suffixImg,
    required this.iconBgColor,
  }) : super(key: key);

  final String suffixImg;
  final Color iconBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {},
        icon: ImageIcon(AssetImage(this.suffixImg)),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: iconBgColor),
    );
  }
}
