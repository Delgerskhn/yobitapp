//TODO: create the challenge screen here
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/challenge/ui/widget/detail/challenge.details.dart';
import 'package:yobit/challenge/ui/widget/info/challenge.info.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';

class ChallengeScreen extends StatefulWidget {
  final challengeId;

  ChallengeScreen({Key? key, this.challengeId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChallengeScreen(challengeId: challengeId);
  }
}

class _ChallengeScreen extends State<ChallengeScreen> {
  final challengeId;
  late Challenge challenge;

  _ChallengeScreen({required this.challengeId});
  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    challenge = await getChallenge(challengeId);
    print(challenge);
  }

  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return FutureProvider(
        create: (_) => getChallenge(challengeId),
        initialData: null,
        catchError: (_, e) => print(e),
        child: FutureBuilder(
            future: getIfUserJoinedChallenge(navmodel.challengeId!),
            builder: (ctx, scaffold) {
              if (scaffold.connectionState == ConnectionState.done) {
                if (scaffold.hasData && scaffold.data as bool == false) {
                  return ChallengeInfo();
                } else if (scaffold.data as bool == true) {
                  return ChallengeDetails();
                }
              }
              //TODO: must be kinda splash screen loader
              return CircularProgressIndicator();
            }));
  }
}
