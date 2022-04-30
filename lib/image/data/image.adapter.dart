import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_web/image_picker_web.dart';

class ImageInfo {
  final Uint8List data;
  final String filename;

  ImageInfo(this.data, this.filename);
}

class ImageAdapter {
  final ImagePicker _picker = ImagePicker();
  Future<ImageInfo?> getImage() async {
    Uint8List? _img;
    String? fileName;
    if (kIsWeb) {
      // var a = await ImagePickerWeb.getImageInfo;
      // if (a != null) _img = base64Decode(a.base64!);
      // fileName = a?.fileName;
    } else {
      var a = await _picker.pickImage(source: ImageSource.gallery);
      fileName = a?.name;
      _img = await a?.readAsBytes();
    }
    if (_img == null || fileName == null) return null;
    return ImageInfo(_img, fileName);
  }
}
