import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/badge/api/badgeRepository.dart';
import 'package:yobit/badge/data/badge.dart';

class Badges extends StatelessWidget {
  final BadgeRepository badgeRepository;

  const Badges({Key? key, required this.badgeRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: badgeRepository.getUserBadges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            var badges = snapshot.data as Iterable<Badge>;
            return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: badges
                    .map((e) => VStack([
                          CachedNetworkImage(
                            imageUrl: e.imgUrl,
                            width: 90,
                          ),
                          e.name.text.white.make()
                        ], crossAlignment: CrossAxisAlignment.center))
                    .toList());
          }
          return CircularProgressIndicator().box.alignCenter.make();
        });
  }
}
