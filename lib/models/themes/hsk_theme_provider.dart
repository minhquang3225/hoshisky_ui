import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/measure/hsk_color_scheme.dart';
import 'package:hoshisky_ui/constants/measure/hsk_measure.dart';
import 'package:hoshisky_ui/models/themes/hsk_theme.dart';

abstract class HskThemeProvider extends ChangeNotifier {
  // Các thuộc tính chung cho theme
  HskMeasure get measure; // Phương thức để lấy kích thước
  HskColorScheme get colorScheme;

  HskTheme get currentTheme; // Phương thức để lấy màu sắc


  void setTheme(HskTheme newTheme);

  ThemeData getTheme(bool isDarkMode);
  
}