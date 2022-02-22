import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/background/star.bg.abs.dart';

typedef WrapperFn = Widget Function();

class StarBackground extends StatelessWidget {
  final WrapperFn child;

  const StarBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ZStack([StarBgAbs(), this.child()]));
  }
}
