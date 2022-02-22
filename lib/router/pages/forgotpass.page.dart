import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/screens/forgotpass.dart';

class ForgotPassPage extends Page {
  ForgotPassPage() : super(key: ValueKey('HomePage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return ForgotPass();
      },
    );
  }
}
