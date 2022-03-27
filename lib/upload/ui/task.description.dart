import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/text.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      HStack([
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.star_border,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 13,
        ),
        'Танилцуулга'.text.white.make()
      ]),
      'Өнөөдрийн даалгаварт та найзтайгаа цуг зурагаа авхуулах юм.'
          .dText
          .white
          .make()
    ]);
  }
}
