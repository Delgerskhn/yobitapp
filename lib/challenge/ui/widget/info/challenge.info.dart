import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/router/navigation.model.dart';

import './challenge.ruby.dart';
import './challenge.sponser.dart';
import './challenge.stars.dart';

class ChallengeInfo extends StatelessWidget {
  const ChallengeInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var challenge = Provider.of<Challenge?>(context);
    var navmodel = Provider.of<NavigationModel>(context);
    return Container(
      child: Column(
        children: [
          ChallengeStars(),
          ChallengeRuby().box.py32.make(),
          ChallengeSponser(),
          HStack([
            BtnIcon(
              iconBgColor: Theme.of(context).primaryColor,
              suffixImg: 'assets/icons/Back Icon.png',
              onPress: () {
                Navigator.pop(context);
              },
            ).box.width(59).height(59).make(),
            SizedBox(
              width: 20,
            ),
            ElevatedButton(
              style: primaryButtonStyle(context),
              onPressed: () {
                joinChallenge(challenge!.id);
              },
              child: Text('Оролцох'),
            ).box.width(250).height(59).make()
          ]).py24()
          // Container(
          //   margin: const EdgeInsets.only(top: 30),
          //   child: ListTile(
          //     title: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         Container(
          //           width: MediaQuery.of(context).size.width * .2,
          //           height: 50,
          //           child: ElevatedButton(
          //             onPressed: () {},
          //             child: Icon(Icons.arrow_back,
          //                 color: Colors.deepOrangeAccent, size: 30),
          //             style: ButtonStyle(
          //               backgroundColor:
          //                   MaterialStateProperty.all<Color>(Colors.deepOrange),
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                 RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(18.0),
          //                   side: BorderSide(color: Colors.red),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //         Container(
          //           width: MediaQuery.of(context).size.width * .6,
          //           height: 50,
          //           child: ElevatedButton(
          //             onPressed: () {
          //               joinChallenge(challenge!.id);
          //               navmodel.pushChallengePage(challenge.id);
          //             },
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text("Оролцох",
          //                     style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 20,
          //                       fontWeight: FontWeight.bold,
          //                     )),
          //                 Icon(Icons.arrow_forward_ios,
          //                     color: Colors.amber, size: 30)
          //               ],
          //             ),
          //             style: ButtonStyle(
          //               backgroundColor:
          //                   MaterialStateProperty.all<Color>(Colors.deepOrange),
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                 RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(18.0),
          //                   side: BorderSide(color: Colors.red),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
