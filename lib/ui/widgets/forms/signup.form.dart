import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/constants/ui/styles/button.style.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/ui/widgets/elements/btn.icon.dart';
import 'package:yobit/ui/widgets/elements/suffix.input.dart';
import 'package:yobit/ui/widgets/elements/suffix.password.dart';

class SignUpForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpFormState();
  }
}

String _email = "";
String _password = "";
String _name = "";

void onEmailChanged(String email) {
  _email = email;
}

void onPassChanged(String pass) {
  _password = pass;
}

void onNameChanged(String name) {
  _name = name;
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final navmodel = Provider.of<NavigationModel>(context);
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
                  onChanged: onNameChanged,
                  hintText: Strings.name,
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixInput(
                  onChanged: onEmailChanged,
                  suffixImg: Paths.userFilledIcon,
                  hintText: Strings.email,
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixPassword(
                  suffixImg: Paths.lockFilledIcon,
                  onChanged: onPassChanged,
                  hintText: Strings.password,
                  iconBgColor: Theme.of(context).colorScheme.primaryVariant),
            ),
            Padding(padding: EdgeInsets.only(top: 40), child: null),
            Row(children: [
              BtnIcon(
                iconBgColor: Theme.of(context).primaryColor,
                suffixImg: Paths.userFilledIcon,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                  child: ElevatedButton(
                style: primaryButtonStyle(context),
                onPressed: () async {
                  final result =
                      await authViewModel.signup(_email, _name, _password);
                  if (result == true) Navigator.pop(context);
                },
                child: const Text(Strings.signUp),
              ))
            ]),
          ],
        ),
        width: 300,
      ),
    );
  }
}
