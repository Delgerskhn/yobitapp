import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/utils/hex.color.dart';

class VChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const VChallengeCard({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navModel = Provider.of<NavigationModel>(context);
    return GestureDetector(
      child: ZStack(
        [
          VStack([
            challenge.title.text.white.bold
                .size(16)
                .make()
                .box
                .px16
                .make()
                .box
                .py32
                .make(),
            CachedNetworkImage(imageUrl: challenge.planet)
          ]),
        ],
      )
          .box
          .width(162)
          .margin(EdgeInsets.only(bottom: 24))
          .customRounded(BorderRadius.circular(25))
          .color(HexColor.fromHex(challenge.color))
          .make(),
      onTap: () {
        navModel.pushChallengePage(challenge.id);
      },
    );
  }
}
