import 'package:hoshisky_ui/models/colors/hsk_colors.dart';
import 'package:hoshisky_ui/models/colors/hsk_ordinal_colors.dart';

abstract class HskButtonBackgroundColors {
  HskOrdinalColors get base;
  HskOrdinalColors get disabled;
  // HskColors get pressed;
}

abstract class HskBaseButtonBackgroundColors{
  HskColors get primary;
}
abstract class HskDisabledButtonBackgroundColors{
  HskColors get primary;
}
