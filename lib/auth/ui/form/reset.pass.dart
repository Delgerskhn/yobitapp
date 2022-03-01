import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/ui/elements/btn.primary.dart';
import 'package:yobit/core/ui/elements/text.input.sec.dart';

class ResetPassForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResetPassForm();
}

class _ResetPassForm extends State<ResetPassForm> {
  String _code = "";
  String _password = "";

  void onCodeChanged(String code) {
    _code = code;
  }

  void onPassChanged(String pass) {
    _password = pass;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Container(
        height: MediaQuery.of(context).size.height / 3.6,
        width: MediaQuery.of(context).size.width * 14 / 16,
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 2, right: 30, left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Доорх хэсэгт бүртгэлтэй мэйл хаягаа"),
            SizedBox(height: 5),
            Text("үлдээснээр та нууц үгээ сэргээх боломжтой."),
            SizedBox(height: 23),
            Container(
              child: TextInputSecondary(
                hintText: 'Code',
                onChanged: onCodeChanged,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            SizedBox(height: 23),
            Container(
              child: TextInputSecondary(
                hintText: 'New password',
                onChanged: onPassChanged,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            SizedBox(height: 16),
            BtnPrimary(
              text: 'Нууц үг сэргээх',
              onPressed: () {
                authViewModel.confirmPasswordReset(_code, _password);
              },
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white));
  }
}
