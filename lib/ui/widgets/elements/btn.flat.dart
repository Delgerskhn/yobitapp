import 'package:flutter/material.dart';
import 'package:yobit/constants/ui/styles/button.style.dart';

class BtnFlat extends StatelessWidget {
  final String text;
  const BtnFlat({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: textButtonStyle(context),
      onPressed: () {},
      child: Text(this.text),
    );
  }
}
