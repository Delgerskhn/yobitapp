import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white)),
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white54),
        hintText: this.hintText,
      ),
    );
  }
}
