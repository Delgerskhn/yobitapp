import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxContinuousRectangle(
      width: 327,
      height: 100,
      backgroundColor: Theme.of(context).primaryColor,
      radius: 20,
      child: HStack(
        [
          VStack(
            [
              VxCircle(
                radius: 12,
              ),
              SizedBox(height: 6),
              'Оноо'.text.white.size(12).make(),
              SizedBox(height: 6),
              '1900'.text.white.size(16).make(),
            ],
            alignment: MainAxisAlignment.spaceBetween,
            crossAlignment: CrossAxisAlignment.center,
          ),
          VStack(
            [
              VxCircle(
                radius: 12,
              ),
              SizedBox(height: 6),
              'Оноо'.text.white.size(12).make(),
              SizedBox(height: 6),
              '1900'.text.white.size(16).make(),
            ],
            alignment: MainAxisAlignment.spaceBetween,
            crossAlignment: CrossAxisAlignment.center,
          ),
          VStack(
            [
              VxCircle(
                radius: 12,
              ),
              SizedBox(height: 6),
              'Оноо'.text.white.size(12).make(),
              SizedBox(height: 6),
              '1900'.text.white.size(16).make(),
            ],
            alignment: MainAxisAlignment.spaceBetween,
            crossAlignment: CrossAxisAlignment.center,
          ),
        ],
        alignment: MainAxisAlignment.spaceAround,
      ).p16(),
    );
  }
}
