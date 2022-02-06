import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/forms/forgot.pass.dart';
import 'package:yobit/ui/widgets/static/forgot.pass.bg.dart';

class ForgotPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          mini: true,
          child: Text('back'),
        ),
        body: ForgotPassBackground(child: () => ForgotPassForm()));
  }
}
