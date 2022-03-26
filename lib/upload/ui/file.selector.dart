import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FileSelector extends StatelessWidget {
  const FileSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VStack([
      'Даалгавар илгээх'.text.white.make(),
      SizedBox(
        height: 8,
      ),
      'Та доорх хэсэгт өнөөдрийн даалгавараа илгээх боломжтой'
          .text
          .white
          .make(),
      SizedBox(
        height: 30,
      ),
      DottedBorder(
        dashPattern: [6, 3, 2, 3],
        borderType: BorderType.RRect,
        color: Colors.white,
        radius: const Radius.circular(12),
        strokeWidth: 1,
        child: VxBox(
                child: IconButton(
          icon: Icon(Icons.upload),
          onPressed: () {},
        ).box.size(80, 80).roundedFull.white.make())
            .alignCenter
            .width(290)
            .height(156)
            .make(),
      )
    ]);
  }
}
