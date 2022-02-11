import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/logic/view_models/auth.view.model.dart';
import 'package:yobit/ui/widgets/elements/slider.dart' as SpecialChallenge;
import 'package:yobit/ui/widgets/elements/text21.dart';
import 'package:yobit/ui/widgets/elements/user.gadget.dart';
import 'package:yobit/ui/widgets/static/star.background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    var authModel = Provider.of<AuthViewModel>(context);
    FirebaseAuth auth = FirebaseAuth.instance;

    return StarBackground(
        child: () => Container(
              padding: EdgeInsets.symmetric(vertical: 35),
              child: Column(
                children: [
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
                  // ChallengeContainer(),
                  TextButton(
                    onPressed: () async {
                      var res = await authModel.logout();
                    },
                    child: Text("Sign out"),
                  )
                ],
              ),
            ));
  }
}
