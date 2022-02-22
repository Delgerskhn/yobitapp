//TODO: create the challenge screen here
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.dart';
import 'package:yobit/challenge/ui/widget/info/challenge.info.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return FutureBuilder(
        future: getIfUserJoinedChallenge(navmodel.challengeId!),
        builder: (ctx, scaffold) {
          if (scaffold.connectionState == ConnectionState.done) {
            if (scaffold.hasData && scaffold.data as bool == false) {
              return ChallengeInfo();
            } else if (scaffold.data as bool == true) {
              return ChallengeDetails();
            }
          }
          return CircularProgressIndicator();
        });
  }
}
