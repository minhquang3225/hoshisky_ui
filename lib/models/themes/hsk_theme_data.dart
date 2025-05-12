import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/measure/hsk_color_scheme.dart';
import 'package:hoshisky_ui/constants/measure/hsk_measure.dart';

class HskThemeData {
  final HskMeasure measure;
  final HskColorScheme colorScheme;
  final ThemeData theme;

  HskThemeData({required this.measure, required this.colorScheme, required this.theme});
}
