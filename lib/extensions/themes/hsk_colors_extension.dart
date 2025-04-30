
import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/colors/hsk_colors.dart';

extension HskColorsModeExtension on HskColors {
  Color byMode(bool isDarkMode) => isDarkMode ? dark : light;
}
