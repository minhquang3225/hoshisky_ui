// Tạo abstract class
import 'package:hoshisky_ui/models/colors/hsk_ordinal_colors.dart';
import 'package:hoshisky_ui/models/measures/button/hsk_button_state.dart';

abstract class HskButtonColors {
  HskButtonState get background;
  HskOrdinalColors get overlay;
  HskButtonState get foreground;
  HskButtonState get border;
}