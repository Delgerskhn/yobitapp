import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/core/ui/elements/text.input.sec.dart';
import 'package:yobit/utils/toast.dart';

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

    return VStack(
      [
        HStack(
          [FloatingBackButton()],
          axisSize: MainAxisSize.max,
        ).box.margin(EdgeInsets.only(top: 50)).px32.make(),
        VStack(
          [
            'Доорх хэсэгт бүртгэлтэй мэйл хаягаа үлдээснээр та нууц үгээ сэргээх боломжтой.'
                .text
                .align(TextAlign.center)
                .lineHeight(1.8)
                .color(Color(0xff573353))
                .bold
                .make()
                .box
                .width(315)
                .make(),
            SizedBox(height: 23),
            Container(
              child: TextInputSecondary(
                hintText: 'И-мэйл',
                onChanged: onEmailChanged,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: primaryButtonStyle(context),
              child: authViewModel.loading
                  ? SizedBox(
                      child: CircularProgressIndicator(), height: 16, width: 16)
                  : Text('Нууц үг сэргээх'),
              onPressed: () {
                authViewModel.sendPasswordResetEmail(_email).then((value) {
                  showSuccess('Та и-мэйлээ шалгана уу!');
                  Navigator.of(context).pop();
                });
              },
            ).box.width(289).make()
          ],
          alignment: MainAxisAlignment.center,
          crossAlignment: CrossAxisAlignment.center,
        )
            .box
            .size(350, 240)
            .p20
            .customRounded(BorderRadius.circular(12))
            .margin(EdgeInsets.only(bottom: 156))
            .color(Colors.white)
            .make()
      ],
      alignment: MainAxisAlignment.spaceBetween,
      crossAlignment: CrossAxisAlignment.center,
    ).backgroundColor(Colors.transparent).hFull(context).wFull(context);
  }
}
