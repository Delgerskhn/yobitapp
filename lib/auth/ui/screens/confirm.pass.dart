import 'package:flutter/material.dart';
import 'package:yobit/auth/ui/form/reset.pass.dart';
import 'package:yobit/auth/ui/widget/forgot.pass.bg.dart';
import 'package:yobit/core/ui/background/earth.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';

class ConfirmPassScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EarthBackground(child: () => ResetPassForm());
  }
}
