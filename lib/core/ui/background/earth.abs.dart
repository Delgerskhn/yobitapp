import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EarthAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(
          'assets/images/Low Poly Planet Earth.H03 1.png',
        ),
      ),
      alignment: Alignment.topCenter,
    );
  }
}
