import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/challenge/api/challenge.repository.dart';
import 'package:yobit/challenge/data/challenge.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/task/ui/task.container.dart';

import 'challenge.details.image.dart';
import 'challenge.details.time.dart';
import 'challenge.tasks.dart';

class ChallengeDetails extends StatelessWidget {
  const ChallengeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/Stars.png"),
        //     fit: BoxFit.cover,
        //   ),
        //   gradient: LinearGradient(
        //       colors: [Color(0xff080712), Color(0xff201F3A)],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter),
        // ),
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
              TaskContainer()
            ],
          ),
        ),
      ),
    );
  }
}
