//TODO: create the challenge screen here
import 'package:flutter/material.dart';
import 'package:yobit/ui/widgets/ChallengeWidgets/challengeRuby.dart';
import 'package:yobit/ui/widgets/ChallengeWidgets/challengeSponser.dart';
import 'package:yobit/ui/widgets/ChallengeWidgets/challengeStars.dart';
import 'package:yobit/ui/widgets/static/star.background.dart';
import 'package:yobit/ui/widgets/static/star.bg.abs.dart';

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {},
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 30, top: 12),
                child: Image.asset(
                  "assets/images/profile.png",
                  // scale: 2.3,
                  width: 35,
                  height: 25,
                )
                // child: const Icon(Icons.ac_unit, color: Colors.green),
                )
          ],
        ),
        body: StarBackground(
          child: () => Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChallengeStars(),
                  ChallengeRuby(),
                  ChallengeSponser(),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .2,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.arrow_back,
                                  color: Colors.deepOrangeAccent, size: 30),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepOrange),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .6,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Оролцох",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.amber, size: 30)
                                ],
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.deepOrange),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
