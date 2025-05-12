import 'package:hoshisky_ui/models/colors/hsk_colors.dart';
import 'package:hoshisky_ui/models/themes/hsk_ordinal.dart';
import 'package:hoshisky_ui/models/themes/hsk_state.dart';

abstract class HskSurfaceRoles {
  HskState<HskOrdinal<HskColors>> get background;
  HskState<HskOrdinal<HskColors>> get foreground;
}