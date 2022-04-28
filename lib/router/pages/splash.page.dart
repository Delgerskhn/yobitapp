import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashPage extends Page {
  final String process;

  SplashPage({required this.process})
      : super(key: ValueKey('SplashPage$process'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return VxBox()
            .bgImage(DecorationImage(
                image: AssetImage('assets/images/Start.png'),
                fit: BoxFit.cover))
            .height(MediaQuery.of(context).size.height)
            .width(MediaQuery.of(context).size.width)
            .make();
      },
    );
  }
}
