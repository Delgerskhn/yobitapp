import 'package:flutter/material.dart';

class ChallengeDetailsImage extends StatelessWidget {
  const ChallengeDetailsImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 20,
          right: 20,
          child: SizedBox(
            width: double.infinity,
            //  new CustomPaint(painter: new Rectangle())
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFF0099FF),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  "Кпс-ийн гариг",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/Garig4.png",
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
