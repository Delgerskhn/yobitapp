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
      style: TextStyle(color: Theme.of(context).primaryColor),
      onChanged: onChange,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: const BorderSide(color: Colors.transparent)),
        fillColor: Theme.of(context).primaryColor,
        hintStyle: TextStyle(color: Colors.primaries.last),
        hintText: this.hintText,
      ),
    );
  }
}
