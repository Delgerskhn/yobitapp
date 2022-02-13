import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/ui/widgets/elements/btn.flat.dart';
import 'package:yobit/ui/widgets/elements/btn.primary.dart';
import 'package:yobit/ui/widgets/elements/suffix.input.dart';
import 'package:yobit/ui/widgets/elements/suffix.password.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final navmodel = Provider.of<NavigationModel>(context);

    String _email = "";
    String _password = "";

    void onEmailChanged(String email) {
      _email = email;
    }

    void onPassChanged(String pass) {
      _password = pass;
    }

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
                  suffixImg: Paths.userFilledIcon,
                  hintText: Strings.email,
                  onChanged: onEmailChanged,
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixPassword(
                  suffixImg: Paths.lockFilledIcon,
                  hintText: Strings.password,
                  onChanged: onPassChanged,
                  iconBgColor: Theme.of(context).colorScheme.primaryVariant),
            ),
            Padding(padding: EdgeInsets.only(top: 40), child: null),
            Row(children: [
              Expanded(
                  child: BtnPrimary(
                text: Strings.signIn,
                onPressed: () async {
                  final result = await authViewModel.login(_email, _password);
                  if (result) navmodel.onLogin();
                },
              )),
            ]),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Row(children: [
              Expanded(
                  child: BtnPrimary(
                text: Strings.signUp,
                onPressed: () {
                  navmodel.pushSignUp();
                },
              )),
            ]),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: null,
            ),
            Flexible(
              child: BtnFlat(
                  text: Strings.resetPassword,
                  onPressed: () {
                    navmodel.pushResetPass();
                  }),
            )
          ],
        ),
        width: 300,
      ),
    );
  }
}
