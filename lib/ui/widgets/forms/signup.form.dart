import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/constants/infrastructure/strings.dart';
import 'package:yobit/constants/ui/styles/button.style.dart';
import 'package:yobit/ui/widgets/elements/btn.icon.dart';
import 'package:yobit/ui/widgets/elements/icon.box.dart';
import 'package:yobit/ui/widgets/elements/suffix.input.dart';
import 'package:yobit/ui/widgets/elements/suffix.password.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  hintText: Strings.name,
                  iconBgColor: Theme.of(context).primaryColor),
            ),
            Padding(padding: EdgeInsets.only(top: 20), child: null),
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
              TextButton(
                  onPressed: () {},
                  child: BtnIcon(
                    iconBgColor: Theme.of(context).primaryColor,
                    suffixImg: Paths.userFilledIcon,
                  )),
              Expanded(
                  child: ElevatedButton(
                style: primaryButtonStyle(context),
                onPressed: () {},
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
