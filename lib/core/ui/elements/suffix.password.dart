import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobit/core/ui/elements/password.input.dart';

import 'icon.box.dart';

class SuffixPassword extends StatelessWidget {
  final String suffixImg;
  final String hintText;
  final void Function(String) onChanged;
  final Color iconBgColor;
  const SuffixPassword(
      {required this.suffixImg,
      required this.hintText,
      required this.iconBgColor,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconBox(suffixImg: suffixImg, iconBgColor: iconBgColor),
          Expanded(
            child: PasswordInput(
              hintText: hintText,
              onChanged: onChanged,
            ),
          ),
        ]);
  }
}
