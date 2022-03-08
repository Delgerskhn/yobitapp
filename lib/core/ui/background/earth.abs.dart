import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EarthAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        alignment: Alignment.topCenter,
        image: AssetImage('assets/images/Low Poly Planet Earth.H03 1.png'),
        fit: BoxFit.fitWidth,
      )),
      alignment: Alignment.topCenter,
    );
  }
}
