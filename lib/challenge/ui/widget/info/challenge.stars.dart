import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';

class ChallengeStars extends StatelessWidget {
  const ChallengeStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = context.watch<Challenge?>();
    return ZStack([
      VxBox(
              child: challenge != null
                  ? CachedNetworkImage(
                      imageUrl: challenge.imgUrl,
                      fit: BoxFit.fill,
                    )
                  : CircularProgressIndicator())
          .height(195)
          .alignCenter
          .customRounded(BorderRadius.circular(25))
          .make()
    ]).w(345);
  }
}
