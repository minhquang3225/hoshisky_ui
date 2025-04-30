import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/colors/hsk_colors.dart';

abstract class HskButtonBackgroundColors {
  Color get baseLight;
  Color get baseDark;
  Color get pressedLight;
  Color get pressedDark;
  Color get disabledLight;
  Color get disabledDark;
  dynamic get base;
  dynamic get disabled;
  // HskColors get pressed;
}