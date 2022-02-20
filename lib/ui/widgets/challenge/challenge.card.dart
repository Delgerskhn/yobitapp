import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/constants/infrastructure/paths.dart';
import 'package:yobit/logic/models/challenge.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZStack([
      VxBox(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: CachedNetworkImage(
                imageUrl: challenge.imgUrl,
                fit: BoxFit.cover,
              ))).width(162).make(),
      VxBox(child: challenge.title.text.xl.bold.wrapWords(true).make())
          .padding(Vx.m24)
          .margin(Vx.mV32)
          .make()
    ]);
  }
}
