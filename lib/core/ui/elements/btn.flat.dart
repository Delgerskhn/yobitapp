import 'package:flutter/material.dart';
import 'package:yobit/core/styles/button.style.dart';

class BtnFlat extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const BtnFlat({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: textButtonStyle(context),
      onPressed: () {
        onPressed!();
      },
      child: Text(this.text),
    );
  }
}
