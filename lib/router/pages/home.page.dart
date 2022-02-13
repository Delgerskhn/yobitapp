import 'package:flutter/material.dart';
import 'package:yobit/ui/screens/home.dart';

class HomePage extends Page {
  HomePage() : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return HomeScreen();
      },
    );
  }
}
