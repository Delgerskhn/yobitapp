import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.dart';
import 'package:yobit/challenge/ui/widget/info/challenge.info.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';

class ChallengeScreen extends StatefulWidget {
  final challengeId;
  final ChallengeRepository challengeRepo;

  ChallengeScreen({Key? key, this.challengeId, required this.challengeRepo})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChallengeScreen(challengeId: challengeId);
  }
}

class _ChallengeScreen extends State<ChallengeScreen> {
  final challengeId;

  _ChallengeScreen({required this.challengeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StarBackground(
            child: () => VStack(
                  [
                    HStack(
                      [FloatingBackButton(), UserGadget()],
                      alignment: MainAxisAlignment.spaceBetween,
                      axisSize: MainAxisSize.max,
                    ).px24().pOnly(top: 38, bottom: 41),
                    FutureProvider<Challenge?>(
                      create: (_) =>
                          this.widget.challengeRepo.getChallenge(challengeId),
                      initialData: null,
                      catchError: (_, e) {
                        print(e);
                        return null;
                      },
                      child: StreamBuilder(
                        stream: this
                            .widget
                            .challengeRepo
                            .getIfUserJoinedChallenge(challengeId),
                        initialData: null,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var data = snapshot.data
                                as QuerySnapshot<Map<String, dynamic>>;
                            if (data.size != 0) return ChallengeDetails();
                            return ChallengeInfo(
                                challengeRepo: this.widget.challengeRepo);
                          }
                          return CircularProgressIndicator()
                              .box
                              .alignCenter
                              .make();
                        },
                      ),
                    ),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).scrollVertical()));
  }
}
