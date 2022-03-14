import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/profile/ui/profile.tabs.dart';
import 'package:yobit/profile/ui/summary.dart';
import 'package:yobit/profile/ui/upcomings.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StarBackground(
          child: () => VStack(
                [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ).box.margin(EdgeInsets.only(top: 94)).make(),
                  '${auth.currentUser?.displayName}'
                      .text
                      .white
                      .headline5(context)
                      .make()
                      .box
                      .py12
                      .make(),
                  ProfileSummary().box.margin(EdgeInsets.only(top: 12)).make(),
                  ProfileTabs().box.width(327).py16.make(),
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).wFull(context).scrollVertical()),
      floatingActionButton: FloatingBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
