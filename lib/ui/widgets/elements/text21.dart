import 'package:flutter/material.dart';

class Text21 extends StatelessWidget {
  final text;
  late TextStyle? style;
  Text21({this.text, this.style}) {
    if (this.style == null)
      this.style = TextStyle(color: Colors.white, fontSize: 19);
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: this.style,
    );
  }
}
