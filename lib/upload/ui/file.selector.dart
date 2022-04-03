import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' as IO;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yobit/core/ui/text.dart';
import 'package:yobit/router/navigation.model.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';

class FileSelector extends StatefulWidget {
  const FileSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<FileSelector> createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  final ImagePicker _picker = ImagePicker();
  Uint8List? image;

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
      if (image != null) Image.memory(image!),
      DottedBorder(
        dashPattern: [6, 3, 2, 3],
        borderType: BorderType.RRect,
        color: Colors.white,
        radius: const Radius.circular(12),
        strokeWidth: 1,
        child: VxBox(
                child: IconButton(
          icon: Icon(
            Icons.upload,
            color: Color.fromRGBO(255, 86, 94, 1),
          ),
          onPressed: () async {
            Uint8List? _img;
            String? fileName;
            if (kIsWeb) {
              var a = await ImagePickerWeb.getImageInfo;
              if (a != null) _img = base64Decode(a.base64!);
              fileName = a?.fileName;
            } else {
              var a = await _picker.pickImage(source: ImageSource.gallery);
              fileName = a?.name;
              _img = await a?.readAsBytes();
            }
            if (_img != null && fileName != null)
              Provider.of<NavigationModel>(context, listen: false)
                  .pushFilePreview(fileName, _img);
          },
        ).box.size(80, 80).roundedFull.white.make())
            .alignCenter
            .width(290)
            .height(156)
            .make(),
      )
      // Image.file(File(image!.path))
    ]);
  }
}
