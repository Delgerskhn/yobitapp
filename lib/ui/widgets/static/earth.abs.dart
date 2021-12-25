import 'package:flutter/cupertino.dart';

class EarthAbs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Positioned(
        child: new Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Low Poly Planet Earth.H03 1.png'),
                  fit: BoxFit.cover),
            ),
            child: null),
        left: 0,
        top: 0,
        right: 0,
        bottom: 400);
  }
}
