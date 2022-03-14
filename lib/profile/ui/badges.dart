import 'package:flutter/cupertino.dart';

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
        Image.asset(
          "assets/images/ruby.png",
          width: 90,
        ),
      ],
    );
  }
}
