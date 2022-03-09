import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/errors/autherror.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/elements/btn.flat.dart';
import 'package:yobit/core/ui/elements/btn.primary.dart';
import 'package:yobit/core/ui/elements/suffix.input.dart';
import 'package:yobit/core/ui/elements/suffix.password.dart';
import 'package:yobit/router/navigation.model.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
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

    return Form(
      key: _formKey,
      child: Container(
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
                    hintText: 'И-мэйл',
                    onChanged: onEmailChanged,
                    iconBgColor: Theme.of(context).primaryColor),
              ),
              Padding(padding: EdgeInsets.only(top: 20), child: null),
              Flexible(
                flex: 1,
                child: SuffixPassword(
                    suffixImg: 'assets/icons/Lock (filled).png',
                    hintText: 'Нууц үг',
                    onChanged: onPassChanged,
                    iconBgColor: Color(0xff623A42)),
              ),
              Padding(padding: EdgeInsets.only(top: 40), child: null),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                  style: primaryButtonStyle(context),
                  child: authViewModel.loading
                      ? SizedBox(
                          child: CircularProgressIndicator(),
                          height: 16,
                          width: 16)
                      : Text('Нэвтрэх'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      authViewModel.login(_email, _password);
                    }
                  },
                )),
              ]),
              Padding(padding: EdgeInsets.only(top: 20), child: null),
              Row(children: [
                Expanded(
                    child: BtnPrimary(
                  text: 'Бүртгэл үүсгэх',
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
                    text: 'Нууц үг сэргээх',
                    onPressed: () {
                      navmodel.pushResetPass();
                    }),
              )
            ],
          ),
          width: 300,
        ),
      ),
    );
  }
}
