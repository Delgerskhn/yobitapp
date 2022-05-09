import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/profile/api/getUpcomingTasks.dart';
import 'package:yobit/userTask/api/user.task.repo.dart';

class Stats extends StatefulWidget {
  final UserTaskRepository userTaskRepository;

  const Stats({Key? key, required this.userTaskRepository}) : super(key: key);
  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int totalTasks = 1;
  int completedTasks = 0;

  @override
  void initState() {
    super.initState();
    getUpcomingTasks().then((value) {
      if (value.isNotEmpty) {
        setState(() {
          totalTasks = value.length;
        });
      }
    });
    this.widget.userTaskRepository.getUserTasks().then((value) {
      setState(() {
        completedTasks = value.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return VStack(
      [
        HStack(
          [
            '7 хоног'
                .text
                .bold
                .color(Color(0xff0C092A))
                .make()
                .box
                .roundedSM
                .padding(Vx.mSymmetric(v: 8, h: 12))
                .white
                .make()
          ],
          alignment: MainAxisAlignment.end,
          axisSize: MainAxisSize.max,
        ),
        SizedBox(height: 24),
        HStack(
          [
            'Энэ долоо хоногт та  $totalTasks даалгаварт оролцов.'
                .text
                .lineHeight(1.5)
                .size(20)
                .bold
                .align(TextAlign.center)
                .white
                .make()
                .box
                .width(247)
                .make(),
          ],
          axisSize: MainAxisSize.max,
          alignment: MainAxisAlignment.center,
        ),
        SizedBox(height: 16),
        HStack(
          [
            ZStack([
              CircularProgressIndicator(
                value: 1,
                strokeWidth: 10,
                color: Colors.white,
              ).box.size(148, 148).make(),
              CircularProgressIndicator(
                value: completedTasks / totalTasks,
                strokeWidth: 10,
              ).box.size(148, 148).make(),
              VStack(
                [
                  HStack(
                    [
                      completedTasks
                          .toString()
                          .text
                          .headline5(context)
                          .white
                          .bold
                          .make(),
                      '/$totalTasks'.text.medium.white.bold.make()
                    ],
                    alignment: MainAxisAlignment.end,
                  ),
                  'Биелүүлсэн'.text.make()
                ],
                alignment: MainAxisAlignment.center,
                crossAlignment: CrossAxisAlignment.center,
                axisSize: MainAxisSize.max,
              ).w(148).h(148)
            ])
          ],
          alignment: MainAxisAlignment.center,
          axisSize: MainAxisSize.max,
        ),
        SizedBox(height: 24),
        HStack([
          VStack([
            '$totalTasks'
                .text
                .extraBold
                .color(Color(0xff0C092A))
                .headline5(context)
                .make(),
            'Уралдаанд оролцсон'
                .text
                .color(Color(0xff0C092A))
                .bold
                .size(10)
                .make()
                .box
                .width(119)
                .make()
          ])
              .box
              .width(140)
              .customRounded(BorderRadius.circular(20))
              .p16
              .white
              .make(),
          SizedBox(width: 15),
          VStack([
            '$completedTasks'.text.white.extraBold.headline5(context).make(),
            'Амжилттай биелүүлсэн'
                .text
                .white
                .size(10)
                .bold
                .make()
                .box
                .width(119)
                .make()
          ])
              .box
              .customRounded(BorderRadius.circular(20))
              .width(140)
              .p16
              .color(Theme.of(context).primaryColor)
              .make(),
        ])
      ],
      alignment: MainAxisAlignment.center,
    )
        .p16()
        .box
        .color(Color(0xff3DD598))
        .customRounded(BorderRadius.circular(20))
        .make();
  }
}
