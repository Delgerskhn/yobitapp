import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/data/auth.view.model.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/challenge/ui/widget/challenge.container.dart';
import 'package:yobit/challenge/ui/widget/slider.dart' as SpecialChallenge;
import 'package:yobit/core/ui/elements/text21.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthViewModel>(context);
    FirebaseAuth auth = FirebaseAuth.instance;

    return StarBackground(
        child: () => VStack([
              HStack(
                [
                  Text21(
                    text: "Hello ${auth.currentUser?.displayName}",
                  ),
                  UserGadget()
                ],
                alignment: MainAxisAlignment.spaceBetween,
                axisSize: MainAxisSize.max,
              ).px24().pOnly(top: 38, bottom: 21),
              SpecialChallenge.Slider(),
              ChallengeContainer(),
              TextButton(
                onPressed: () {
                  authModel.logout();
                },
                child: Text("Sign out"),
              )
            ]).scrollVertical());
  }
}
