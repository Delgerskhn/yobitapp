import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FloatingBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.of(context).pop();
        },
        mini: true,
        child: Image.asset('assets/icons/Back Icon.png'));
  }
}
