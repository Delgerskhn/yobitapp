import 'dart:html';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/text.dart';

class FileSelector extends StatefulWidget {
  const FileSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  final _pickedImages = <Image>[];
  @override
  Widget build(BuildContext context) {
    return VStack([
      'Даалгавар илгээх'.dText.white.make(),
      SizedBox(
        height: 8,
      ),
      'Та доорх хэсэгт өнөөдрийн даалгавараа илгээх боломжтой'
          .dText
          .white
          .bold
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
                child: _pickedImages.isNotEmpty
                    ? _pickedImages[0]
                    : IconButton(
                        icon: Icon(
                          Icons.upload,
                          color: Color.fromRGBO(255, 86, 94, 1),
                        ),
                        onPressed: () async {
                          final fromPicker =
                              await ImagePickerWeb.getImageAsWidget();
                          setState(() {
                            _pickedImages.clear();
                            if (fromPicker != null)
                              _pickedImages.add(fromPicker);
                          });
                        },
                      ).box.size(80, 80).roundedFull.white.make())
            .alignCenter
            .width(290)
            .height(156)
            .make(),
      )
    ]);
  }
}
