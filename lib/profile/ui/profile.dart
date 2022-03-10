import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/background/star.background.dart';
import 'package:yobit/core/ui/elements/floating.back.button.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StarBackground(
          child: () => VStack(
                [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ).box.margin(EdgeInsets.only(top: 94)).make(),
                  '${auth.currentUser?.displayName}'
                      .text
                      .white
                      .semiBold
                      .size(24)
                      .make()
                      .box
                      .py12
                      .make(),
                  ProfileSummary().box.margin(EdgeInsets.only(top: 12)).make(),
                  ProfileSummaryDesc().box.width(327).py16.make(),
                  UpcomingTasks()
                ],
                crossAlignment: CrossAxisAlignment.center,
              ).wFull(context).scrollVertical()),
      floatingActionButton: FloatingBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([]);
  }
}

class ProfileSummaryDesc extends StatelessWidget {
  const ProfileSummaryDesc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        ...['Цол', 'Үзүүлэлт', 'Дэлгэрэнгүй']
            .map((r) => r.text.bold.white.size(14).make())
      ],
      alignment: MainAxisAlignment.spaceAround,
    );
  }
}

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
