import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/elements/btn.primary.dart';
import 'package:yobit/ui/widgets/elements/text.input.dart';

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
    return Container(
        height: MediaQuery.of(context).size.height / 3.6,
        width: MediaQuery.of(context).size.width * 14 / 16,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Доорх хэсэгт бүртгэлтэй мэйл хаягаа үлдээснээр та нууц үгээ сэргээх боломжтой."),
            TextInput(
              hintText: 'И-мэйл',
              onChanged: onEmailChanged,
            ),
            BtnPrimary(
              text: 'Нууц үг сэргээх',
              onPressed: () {},
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white));
  }
}
