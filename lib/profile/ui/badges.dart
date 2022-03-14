import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class Badges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: [
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
        VStack([
          Image.asset(
            "assets/images/ruby.png",
            width: 90,
          ),
          'Цолын нэр'.text.white.make()
        ], crossAlignment: CrossAxisAlignment.center),
      ],
    );
  }
}
