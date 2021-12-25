import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/ui/widgets/elements/btn.flat.dart';
import 'package:yobit/ui/widgets/elements/btn.primary.dart';
import 'package:yobit/ui/widgets/elements/suffix.input.dart';
import 'package:yobit/ui/widgets/elements/suffix.password.dart';

class SignInForm extends StatelessWidget {
  final VoidCallback onLogin;
  SignInForm(this.onLogin);

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Container(
      alignment: Alignment.center,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 400), child: null),
            Flexible(
              flex: 1,
              child: SuffixInput(
                  suffixImg: Paths.userFilledIcon,
                  hintText: Strings.email,
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixPassword(
                  suffixImg: Paths.lockFilledIcon,
                  hintText: Strings.password,
                  iconBgColor: Theme.of(context).colorScheme.primaryVariant),
            ),
            Padding(padding: EdgeInsets.only(top: 40), child: null),
            Row(children: [
              Expanded(
                  child: BtnPrimary(
                text: Strings.signIn,
                onPressed: () async {
                  final result = await authViewModel.login();
                  if (result == true) onLogin();
                },
              )),
            ]),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Row(children: [
              Expanded(child: BtnPrimary(text: Strings.signUp)),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: null,
            ),
            Flexible(
              child: BtnFlat(text: Strings.resetPassword),
            )
          ],
        ),
        width: 300,
      ),
    );
  }
}
