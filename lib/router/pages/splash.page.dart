import 'package:flutter/material.dart';

class SplashPage extends Page {
  final String process;

  SplashPage({required this.process})
      : super(key: ValueKey('SplashPage$process'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Text("Loading");
      },
    );
  }
}
