import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/router/navigation.model.dart';

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navModel = Provider.of<NavigationModel>(context);
    return GestureDetector(
      child: ZStack(
        [
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl: challenge.featureImg,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ).box.width(162).make(),
          // VxBox(child: challenge.title.text.xl.bold.wrapWords(true).make())
          //     .padding(Vx.m24)
          //     .margin(Vx.mV32)
          //     .make()
        ],
      ),
      onTap: () {
        navModel.pushChallengePage(challenge.id);
      },
    );
  }
}
