import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/screens/advantage.dart';

class AdvantagePage extends Page {
  AdvantagePage() : super(key: ValueKey('AdvantagePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return AdvantageScreen();
      },
    );
  }
}
