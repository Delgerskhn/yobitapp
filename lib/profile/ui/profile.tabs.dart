import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/badge/api/badgeRepository.dart';
import 'package:yobit/profile/ui/badges.dart';
import 'package:yobit/profile/ui/stats.dart';
import 'package:yobit/profile/ui/upcomings.dart';
import 'package:yobit/userTask/api/user.task.repo.dart';

class ProfileTabs extends StatefulWidget {
  const ProfileTabs({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _index = _tabController.index;
      });
    });
  }

  var myTabs = ['Цол', 'Үзүүлэлт', 'Дэлгэрэнгүй']
      .map((r) => r.text.bold.white.size(14).make());
  @override
  Widget build(BuildContext context) {
    return VStack([
      TabBar(
        controller: _tabController,
        tabs: [
          ...['Стат', 'Таскууд', 'Цол'].map((r) => r.text.bold.white.make())
        ],
      ),
      VxBox().p12.make(),
      VStack([
        if (_index == 0)
          Stats(
            userTaskRepository: UserTaskRepository(),
          ),
        if (_index == 1) UpcomingTasks().box.width(345).make(),
        if (_index == 2)
          Badges(
            badgeRepository: BadgeRepository(),
          ).box.width(345).make(),
      ])
    ]);
  }
}
