import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/elements/password.input.dart';
import 'package:yobit/ui/widgets/elements/text.input.dart';

import 'icon.box.dart';

class SuffixPassword extends StatelessWidget {
  final String suffixImg;
  final String hintText;
  final Color iconBgColor;
  SuffixPassword(
      {required this.suffixImg,
      required this.hintText,
      required this.iconBgColor});
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconBox(suffixImg: suffixImg, iconBgColor: iconBgColor),
          Expanded(
            child: PasswordInput(hintText: hintText),
          ),
        ]);
  }
}
