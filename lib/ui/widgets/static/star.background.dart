import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/static/star.bg.abs.dart';

typedef WrapperFn = Widget Function();

class StarBackground extends StatelessWidget {
  final WrapperFn child;

  const StarBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      StarBgAbs(),
      Positioned(child: this.child(), top: 0, right: 0, bottom: 0, left: 0)
    ]));
  }
}
