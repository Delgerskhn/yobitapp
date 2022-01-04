import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final void Function(String) onChanged;
  const TextInput({Key? key, required this.hintText, required this.onChanged})
      : super(key: key);

  final String hintText;
  void onChange(val) {
    onChanged(val);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      onChanged: onChange,
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
