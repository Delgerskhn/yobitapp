import 'package:flutter/material.dart';

class ChallengeStars extends StatelessWidget {
  const ChallengeStars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 20,
          right: 20,
          child: SizedBox(
            width: double.infinity,
            //  new CustomPaint(painter: new Rectangle())
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                "assets/images/Garig4.png",
                width: 200,
                height: 200,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "Кпс-ийн гари",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
