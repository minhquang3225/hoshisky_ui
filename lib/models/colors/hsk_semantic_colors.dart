import 'package:hoshisky_ui/models/colors/hsk_color_pair.dart';

abstract class HskSemanticColors {
  // Primary
  HskColorPair get primaryColor;
  HskColorPair get primaryLightColor;
  HskColorPair get primaryDarkColor;

  // Secondary
  HskColorPair get secondaryColor;
  HskColorPair get secondaryLightColor;
  HskColorPair get secondaryDarkColor;

  // Foreground
  HskColorPair get foregroundColor;
  HskColorPair get disabledForegroundColor;

  // Background
  HskColorPair get backgroundColor;
  HskColorPair get disabledBackgroundColor;

  // Border
  HskColorPair get borderColor;

  // Status
  HskColorPair get errorColor;
  HskColorPair get successColor;
  HskColorPair get warningColor;
  HskColorPair get infoColor;

  // Overlay
  HskColorPair get overlayColor;
  double get overlayOpacity;
}
