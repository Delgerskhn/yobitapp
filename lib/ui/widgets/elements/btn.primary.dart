import 'package:flutter/material.dart';
import 'package:yobit/constants/ui/styles/button.style.dart';

class BtnPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const BtnPrimary({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: primaryButtonStyle(context),
      onPressed: () {
        onPressed!();
      },
      child: Text(this.text),
    );
  }
}
