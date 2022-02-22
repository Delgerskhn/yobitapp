import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/screens/signin.dart';

class LoginPage extends Page {
  LoginPage() : super(key: ValueKey('LoginPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => SignInScreen(),
    );
  }
}
