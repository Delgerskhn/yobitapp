import 'package:flutter/material.dart';

class ChallengeTask extends StatelessWidget {
  const ChallengeTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      child: Row(children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: Icon(Icons.computer, color: Colors.white, size: 30),
              decoration: BoxDecoration(
                  color: const Color(0xFF7012CF), shape: BoxShape.circle),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, left: 10),
                    child: Text(
                      "Даалгавар 1",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Ганцаараа",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF3F3C4E)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
          ),
          child: Column(
            children: [
              Text(
                "00:32:10",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF3F3C4E)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
      decoration: BoxDecoration(
          color: const Color(0xFF292639),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
