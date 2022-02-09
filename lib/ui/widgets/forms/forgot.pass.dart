import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/ui/widgets/elements/btn.primary.dart';
import 'package:yobit/ui/widgets/elements/text.input.dart';
import 'package:yobit/ui/widgets/elements/text.input.sec.dart';

class ForgotPassForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPassForm();
}

class _ForgotPassForm extends State<ForgotPassForm> {
  String _email = "";

  void onEmailChanged(String email) {
    _email = email;
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Container(
        height: MediaQuery.of(context).size.height / 3.6,
        width: MediaQuery.of(context).size.width * 14 / 16,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Доорх хэсэгт бүртгэлтэй мэйл хаягаа үлдээснээр та нууц үгээ сэргээх боломжтой."),
            TextInputSecondary(
              hintText: 'И-мэйл',
              onChanged: onEmailChanged,
            ),
            BtnPrimary(
              text: 'Нууц үг сэргээх',
              onPressed: () {
                authViewModel.resetPass(_email);
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
