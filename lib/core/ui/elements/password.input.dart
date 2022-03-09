import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final void Function(String) onChanged;
  const PasswordInput(
      {Key? key, required this.hintText, required this.onChanged})
      : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: true,
      enableSuggestions: false,
      onSaved: (val) {
        onChanged(val!);
      },
      autocorrect: false,
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
