import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/static/circles.bg.abs.dart';
import 'package:yobit/ui/widgets/static/star.bg.abs.dart';

typedef WrapperFn = Widget Function();

class ForgotPassBackground extends StatelessWidget {
  final WrapperFn child;
  const ForgotPassBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        StarBgAbs(),
        CirclesBgAbs(),
        Positioned(
            child: Container(
              child: Image.asset('assets/images/forgotpass.png'),
            ),
            top: 0,
            left: 0,
            right: 0),
        Positioned(child: this.child(), top: 0, right: 0, left: 0)
      ],
    ));
  }
}
