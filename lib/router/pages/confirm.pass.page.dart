import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/screens/confirm.pass.dart';

class ConfirmPassPage extends Page {
  ConfirmPassPage() : super(key: ValueKey('ConfirmPassPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ConfirmPassScreen();
      },
    );
  }
}
