import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/measures/font/hsk_font_role.dart';
import 'package:hoshisky_ui/models/themes/hsk_ordinal.dart';

abstract class HskFontMeasures{
  HskOrdinal<TextStyle> get family;
  HskFontRole get size;
  HskFontRole get weight;
  HskFontRole get space;
}