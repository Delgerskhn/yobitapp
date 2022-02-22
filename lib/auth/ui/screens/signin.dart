import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/form/signin.form.dart';
import 'package:yobit/core/ui/background/earth.background.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen();

  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => SignInForm());
  }
}
