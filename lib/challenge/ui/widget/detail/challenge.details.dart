import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/ui/widget/info/challenge.stars.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/task/ui/task.container.dart';

import 'challenge.details.image.dart';
import 'challenge.details.time.dart';

class ChallengeDetails extends StatelessWidget {
  const ChallengeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        ChallengeDetailsTime(),
        ChallengeStars().box.py24.make(),
        Container(
          child: Row(
            children: [
              VxBox(
                  child: Text(
                "Даалгаварууд",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )).margin(EdgeInsets.only(bottom: 16)).make()
            ],
          ),
        ),
        TaskContainer(
          challengeRepo: ChallengeRepository(),
        )
      ],
    ).w(345);
  }
}
