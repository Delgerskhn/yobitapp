import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/elements/btn.primary.dart';
import 'package:yobit/core/ui/elements/suffix.input.dart';
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
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 400), child: null),
            Flexible(
              flex: 1,
              child: SuffixInput(
                  suffixImg: 'assets/icons/User (filled).png',
                  onChanged: onCodeChanged,
                  hintText: 'Код',
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixInput(
                  onChanged: onPassChanged,
                  suffixImg: 'assets/icons/User (filled).png',
                  hintText: 'Шинэ нууц үг',
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 40), child: null),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                style: primaryButtonStyle(context),
                onPressed: () {
                  authViewModel.confirmPasswordReset(_code, _password);
                },
                child: authViewModel.loading
                    ? SizedBox(
                        child: CircularProgressIndicator(),
                        height: 16,
                        width: 16)
                    : Text('Үргэлжлүүлэх'),
              ))
            ]),
          ],
        ),
        width: 300,
      ),
    );
  }
}
