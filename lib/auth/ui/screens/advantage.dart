import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/auth/ui/widget/advantage.slider.dart';
import 'package:yobit/challenge/ui/widget/slider.dart' as SpecialChallenge;
import 'package:yobit/core/styles/button.style.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/btn.icon.dart';

class AdvantageScreen extends StatefulWidget {
  @override
  State<AdvantageScreen> createState() => _AdvantageScreenState();
}

class _AdvantageScreenState extends State<AdvantageScreen> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return StarBackground(
        child: () => VStack(
              [
                AdvantageSlider(
                  callback: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                VStack(
                  [
                    'Бидний давуу тал'.text.bold.white.size(22).make(),
                    'It looks like you are on track. Please continue to follow your daily plan'
                        .text
                        .size(16)
                        .white
                        .wrapWords(true)
                        .make()
                        .box
                        .margin(EdgeInsets.only(top: 9))
                        .make(),
                  ],
                  crossAlignment: CrossAxisAlignment.center,
                ).box.width(265).margin(EdgeInsets.only(top: 38)).make(),
                HStack([0, 1, 2]
                        .map(
                          (r) => Container(
                            width: 9,
                            height: 9,
                            margin: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(_current == r ? 0.9 : 0.4)),
                          ),
                        )
                        .toList())
                    .box
                    .margin(EdgeInsets.symmetric(vertical: 20, horizontal: 0))
                    .make(),
                HStack([
                  BtnIcon(
                    iconBgColor: Theme.of(context).primaryColor,
                    suffixImg: 'assets/icons/Back Icon.png',
                    onPress: () {
                      // Navigator.pop(context);
                    },
                  ).box.width(59).height(59).make(),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: primaryButtonStyle(context),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Үргэлжлүүлэх'),
                  ).box.width(250).height(59).make()
                ])
              ],
              crossAlignment: CrossAxisAlignment.center,
            ).py64());
  }
}
