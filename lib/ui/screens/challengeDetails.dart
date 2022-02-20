import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/ui/widgets/challengeDetails/challengeDetails.dart';
import 'package:yobit/ui/widgets/challengeDetails/challengeDetailsImage.dart';
import 'package:yobit/ui/widgets/challengeDetails/challengeDetailsTime.dart';

class ChallengeDetailsScreen extends StatelessWidget {
  const ChallengeDetailsScreen({
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
                "assets/profile.png",
                // scale: 2.3,
                width: 35,
                height: 25,
              )
              // child: const Icon(Icons.ac_unit, color: Colors.green),
              )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Stars.png"),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
              colors: [Color(0xff080712), Color(0xff201F3A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChallengeDetailsTime(),
              ChallengeDetailsImage(),
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
                    )).margin(Vx.mH32).make()
                  ],
                ),
              ),
              challengeDetails(),
              challengeDetails(),
            ],
          ),
        ),
      ),
    );
  }
}
