// Tạo abstract class
import 'package:hoshisky_ui/models/colors/hsk_colors.dart';
import 'package:hoshisky_ui/models/themes/hsk_ordinal.dart';
import 'package:hoshisky_ui/models/themes/hsk_state.dart';

abstract class HskButtonColors {
  HskState<HskOrdinal<HskColors>> get background;
  HskOrdinal<HskColors> get overlay;
  HskState<HskOrdinal> get foreground;
  HskState<HskOrdinal> get border;
}