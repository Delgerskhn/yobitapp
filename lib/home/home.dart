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
              Row(
                children: [
                  Text21(
                    text: "Hello ${auth.currentUser!.email}",
                  ),
                  UserGadget()
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SpecialChallenge.Slider(),
              ChallengeContainer(),
              TextButton(
                onPressed: () async {
                  var res = await authModel.logout();
                },
                child: Text("Sign out"),
              )
            ]).py32().scrollVertical());
  }
}
