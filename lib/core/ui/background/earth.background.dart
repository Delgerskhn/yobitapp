import 'package:flutter/material.dart';
import 'package:yobit/core/ui/background/star.bg.abs.dart';

import 'circles.bg.abs.dart';
import 'earth.abs.dart';

typedef WrapperFn = Widget Function();

class EarthBackground extends StatelessWidget {
  final WrapperFn child;

  const EarthBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
          StarBgAbs(),
          EarthAbs(),
          CirclesBgAbs(),
          Positioned(child: this.child(), top: 0, right: 0, left: 0)
        ]),
        backgroundColor: Colors.black);
  }
}
