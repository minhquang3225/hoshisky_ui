import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/measures/font/hsk_font_roles.dart';
import 'package:hoshisky_ui/models/themes/hsk_ordinal.dart';

abstract class HskFontMeasures{
  HskOrdinal<TextStyle> get family;
  HskFontSizeRole get size;
  HskFontWeightRole get weight;
  HskFontSpaceRole get space;
}