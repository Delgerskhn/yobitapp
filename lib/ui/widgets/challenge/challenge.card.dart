import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';

class ChallengeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZStack([
      VxBox(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                Paths.specialChallenge,
                fit: BoxFit.cover,
              ))).width(162).make(),
      VxBox(child: 'CU гараг'.text.xl.bold.make())
          .padding(Vx.m24)
          .margin(Vx.mV32)
          .make()
    ]);
  }
}
