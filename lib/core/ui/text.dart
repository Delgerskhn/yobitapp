import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension StringExtension on String {
  VxTextBuilder get dText =>
      VxTextBuilder(this).size(16).lineHeight(1.5).fontWeight(FontWeight.w400);
}
