import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/badge/api/badgeRepository.dart';

class ProfileSummary extends StatefulWidget {
  final BadgeRepository badgeRepository;
  const ProfileSummary({
    Key? key,
    required this.badgeRepository,
  }) : super(key: key);

  @override
  State<ProfileSummary> createState() => _ProfileSummaryState();
}

class _ProfileSummaryState extends State<ProfileSummary> {
  int challenges = 0;
  int points = 0;
  int rank = 0;

  @override
  void initState() {
    super.initState();
    this.widget.badgeRepository.getUserBadges().then((val) {
      setState(() {
        challenges = val.first.challenges;
        points = val.first.points;
        rank = val.first.rank;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return HStack(
      [
        VStack(
          [
            Icon(Icons.star_border, color: Colors.white),
            SizedBox(height: 6),
            'Оноо'.text.white.size(12).make(),
            SizedBox(height: 6),
            '$points'.text.white.size(16).make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.center,
        ),
        VStack(
          [
            Icon(Icons.numbers_outlined, color: Colors.white),
            SizedBox(height: 6),
            'Ранк'.text.white.size(12).make(),
            SizedBox(height: 6),
            '$rank'.text.white.size(16).make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.center,
        ),
        VStack(
          [
            Icon(Icons.flag_circle_outlined, color: Colors.white),
            SizedBox(height: 6),
            'Уралдаан'.text.white.size(12).make(),
            SizedBox(height: 6),
            '$challenges'.text.white.size(16).make(),
          ],
          alignment: MainAxisAlignment.spaceBetween,
          crossAlignment: CrossAxisAlignment.center,
        ),
      ],
      alignment: MainAxisAlignment.spaceAround,
    ).p16();
  }
}
