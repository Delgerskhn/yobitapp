import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.dart';
import 'package:yobit/challenge/ui/widget/info/challenge.info.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/core/ui/elements/user.gadget.dart';
import 'package:yobit/router/navigation.model.dart';
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
        floatingActionButton: FloatingBackButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: StarBackground(
            child: () => VStack(
                  [
                    HStack(
                      [UserGadget()],
                      alignment: MainAxisAlignment.end,
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
