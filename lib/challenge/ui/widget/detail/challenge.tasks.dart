import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:yobit/task/data/task.dart';

class ChallengeTask extends StatelessWidget {
  final Task task;
  const ChallengeTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navmodel = Provider.of<NavigationModel>(context);
    return HStack(
      [
        Icon(Icons.sports_handball_rounded, color: Colors.white, size: 30)
            .circle(backgroundColor: Colors.amber[600])
            .box
            .margin(EdgeInsets.only(right: 16))
            .size(44, 44)
            .make(),
        Expanded(
          child: HStack(
            [
              VStack(
                [
                  task.title.text.white.ellipsis
                      .wrapWords(true)
                      .make()
                      .box
                      .width(184)
                      .margin(EdgeInsets.only(bottom: 6))
                      .make(),

                  'Ганцаараа'
                      .text
                      .color(Colors.white54)
                      .make()
                      .box
                      .p4
                      .roundedSM
                      .color(Color(0xff3F3C4E))
                      .make()
                  // .continuousRectangle(
                  //     radius: 6, backgroundColor: Color(0xff3F3C4E))
                  // .p(5)
                ],
                alignment: MainAxisAlignment.spaceBetween,
              ),
              VStack(
                [
                  "00:32:10".text.color(Colors.white54).make(),
                  IconButton(
                      onPressed: () {
                        navmodel.pushTaskPage(task.id);
                      },
                      icon:
                          Icon(Icons.play_arrow, color: Colors.white, size: 30))
                ],
                alignment: MainAxisAlignment.spaceBetween,
                crossAlignment: CrossAxisAlignment.end,
              )
            ],
            alignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ],
      axisSize: MainAxisSize.max,
    ).box.p16.withRounded(value: 12).color(Color(0xff292639)).make();
  }
}
