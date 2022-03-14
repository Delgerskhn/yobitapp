import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ImageSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageSelector();
  }
}

class _ImageSelector extends State<ImageSelector> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: imageFile == null
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _getFromGallery();
                      },
                      child: Text("PICK FROM GALLERY"),
                    ),
                    Container(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _getFromCamera();
                      },
                      child: Text("PICK FROM CAMERA"),
                    )
                  ],
                ),
              )
            : Container(
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ));
  }

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
