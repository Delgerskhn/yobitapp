import 'package:flutter/material.dart';

import 'icon.box.dart';

class SuffixInput extends StatelessWidget {
  final String suffixImg;
  final String hintText;
  final void Function(String) onChanged;
  final Color iconBgColor;
  const SuffixInput(
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
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.white54),
              ),
              onSaved: (value) {
                onChanged(value!);
              },
            ),
          ),
        ]);
  }
}
