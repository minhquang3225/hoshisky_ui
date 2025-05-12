import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/measure/hsk_color_scheme.dart';
import 'package:hoshisky_ui/constants/measure/hsk_measure.dart';
import 'package:hoshisky_ui/models/themes/hsk_theme.dart';

abstract class HskThemeProvider extends ChangeNotifier {
  HskMeasure get measure;
  HskColorScheme get colorScheme;
  HskThemeList get currentTheme;
  bool get isDarkMode;

  void setTheme(HskThemeList newTheme);
  void toggleDarkMode();
  ThemeData getTheme(bool isDarkMode);
}