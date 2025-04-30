// Tạo abstract class
import 'package:hoshisky_ui/models/colors/button/property/hsk_button_background_colors.dart';
import 'package:hoshisky_ui/models/colors/button/property/hsk_button_foreground_colors.dart';
import 'package:hoshisky_ui/models/colors/button/property/hsk_button_overlay_colors.dart';

abstract class HskButtonColors {
  HskButtonBackgroundColors get background;
  HskOverlayColors get overlay;
  HskButtonForegroundColors get foreground;
}