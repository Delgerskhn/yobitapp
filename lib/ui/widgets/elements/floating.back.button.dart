import 'package:flutter/material.dart';

class FloatingBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.pop(context);
        },
        mini: true,
        child: Image.asset('assets/icons/Back Icon.png'));
  }
}
