import 'package:flutter/material.dart';

class TextInputSecondary extends StatelessWidget {
  final void Function(String) onChanged;
  const TextInputSecondary(
      {Key? key, required this.hintText, required this.onChanged})
      : super(key: key);

  final String hintText;
  void onChange(val) {
    onChanged(val);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.primaries.first),
      onChanged: onChange,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: const BorderSide(color: Colors.white)),
        fillColor: Colors.white38,
        hintStyle: TextStyle(color: Colors.primaries.last),
        hintText: this.hintText,
      ),
    );
  }
}
