import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';

class ChallengeRuby extends StatelessWidget {
  const ChallengeRuby({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = context.watch<Challenge?>();
    return ZStack([
      VxContinuousRectangle(
        radius: 16,
        backgroundColor: Theme.of(context).primaryColor,
        child: HStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          VStack([
            'Тайлбар'.text.white.size(16).make(),
            SizedBox(
              height: 8,
            ),
            '${challenge?.content ?? ''}'.text.white.bold.size(14).make()
          ])
        ]),
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 40,
      )
          .box
          .alignTopRight
          .transform(Matrix4.translationValues(-10, -20, 0))
          .make(),
    ]).w(345);
  }
}
