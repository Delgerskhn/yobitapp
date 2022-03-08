import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
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
        body: ZStack([
          StarBgAbs(),
          EarthAbs(),
          CirclesBgAbs(),
          VStack([this.child()]).scrollVertical()
        ]),
        backgroundColor: Colors.black);
  }
}
