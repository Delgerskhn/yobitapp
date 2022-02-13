import 'package:flutter/material.dart';
import 'package:yobit/ui/screens/signup.dart';

class SignUpPage extends Page {
  SignUpPage() : super(key: ValueKey('SignUpPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) => SignUpScreen(),
    );
  }
}
