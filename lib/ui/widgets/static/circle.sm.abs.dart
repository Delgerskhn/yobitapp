import 'package:flutter/cupertino.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class CircleBgSmAbs extends StatelessWidget {
  final bottom;

  final left;

  final right;

  final top;

  CircleBgSmAbs(
      {required this.left,
      required this.bottom,
      required this.right,
      required this.top});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Paths.bgCircleSm),
              fit: BoxFit.cover,
            ),
          ),
          child: null /* add child content here */,
        ),
        left: left,
        bottom: bottom,
        top: top,
        right: right);
  }
}
