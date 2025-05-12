import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/measure/hsk_color_scheme.dart';
import 'package:hoshisky_ui/constants/measure/hsk_measure.dart';
import 'package:hoshisky_ui/models/themes/hsk_theme_provider.dart';
import 'package:provider/provider.dart';

extension ThemeProviderExtension on BuildContext{
  HskThemeProvider get themeProvider => read<HskThemeProvider>();
  HskMeasure get measure => themeProvider.measure;
  HskColorScheme get colorScheme => themeProvider.colorScheme;
  bool get isDarkMode => themeProvider.isDarkMode;
}