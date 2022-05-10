import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/form/forgot.pass.dart';
import 'package:yobit/auth/ui/widget/forgot.pass.bg.dart';

class ForgotPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ForgotPassBackground(child: () => ForgotPassForm());
  }
}
