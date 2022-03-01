import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/form/forgot.pass.dart';
import 'package:yobit/auth/ui/widget/forgot.pass.bg.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';

class ForgotPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingBackButton(),
        body: ForgotPassBackground(child: () => ForgotPassForm()));
  }
}
