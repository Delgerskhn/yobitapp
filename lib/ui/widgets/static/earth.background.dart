import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/static/star.bg.abs.dart';

import 'circle.bg.left.lg.abs.dart';
import 'circle.bg.lg.abs.dart';
import 'circle.sm.abs.dart';
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
          // CircleBgLgAbs(left: 140, bottom: 570, right: 0, top: 0),
          // CircleBgLeftLgAbs(left: 0, bottom: 170, right: 185, top: 300),
          // CircleBgSmAbs(left: 287, bottom: 485 - 40, right: 60, top: 300 + 40),
          Positioned(child: this.child(), top: 0, bottom: 0, right: 0, left: 0)
        ]),
        backgroundColor: Colors.black);
  }
}
