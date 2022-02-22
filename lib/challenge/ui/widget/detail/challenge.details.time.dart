import 'package:flutter/material.dart';

class ChallengeDetailsTime extends StatelessWidget {
  const ChallengeDetailsTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 35, bottom: 35),
      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, top: 10, right: 51),
                    child: Text(
                      "03 өдөр : 12 цаг : 10 мин",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.circle_outlined,
                            color: Colors.red, size: 20),
                        Text(
                          "Тэмцээн дуусах хугацаа",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: const Color(0xFF292639),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
