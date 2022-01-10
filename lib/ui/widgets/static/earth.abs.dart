import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EarthAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
        child: Container(
          child: FractionallySizedBox(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                'assets/images/Low Poly Planet Earth.H03 1.png',
              ),
            ),
            heightFactor: 0.42,
            widthFactor: 1,
          ),
          alignment: Alignment.topCenter,
        ),
        left: 0,
        top: 0,
        right: 0,
        bottom: 0);
  }
}
