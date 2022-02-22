import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/suffix.input.dart';
import 'package:yobit/core/ui/elements/suffix.password.dart';
import 'package:yobit/router/navigation.model.dart';

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
                  onChanged: onNameChanged,
                  hintText: 'Нэр',
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixInput(
                  onChanged: onEmailChanged,
                  suffixImg: 'assets/icons/User (filled).png',
                  hintText: 'И-мэйл',
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
            Flexible(
              flex: 1,
              child: SuffixPassword(
                  suffixImg: 'assets/icons/Lock (filled).png',
                  onChanged: onPassChanged,
                  hintText: 'Нууц үг',
                  iconBgColor: Theme.of(context).colorScheme.primaryVariant),
            ),
            Padding(padding: EdgeInsets.only(top: 40), child: null),
            Row(children: [
              BtnIcon(
                iconBgColor: Theme.of(context).primaryColor,
                suffixImg: 'assets/icons/Back Icon.png',
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
                child: const Text('Бүртгэл үүсгэх'),
              ))
            ]),
          ],
        ),
        width: 300,
      ),
    );
  }
}
