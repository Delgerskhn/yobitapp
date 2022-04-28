import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/background/circles.bg.abs.dart';
import 'package:yobit/core/ui/background/star.bg.abs.dart';

typedef WrapperFn = Widget Function();

class AdvantageBackground extends StatelessWidget {
  final WrapperFn child;
  const AdvantageBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        StarBgAbs(),
        CirclesBgAbs(),
        VStack([this.child()])
      ],
    ));
  }
}
