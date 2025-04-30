import 'package:hoshisky_ui/models/colors/hsk_colors.dart';
import 'package:hoshisky_ui/models/colors/hsk_primary_colors.dart';

abstract class HskButtonBorderColors {
  HskPrimaryColors get base;
  HskPrimaryColors get disabled;
  // HskColors get pressed;
}

abstract class HskBaseButtonBorderColors{
  HskColors get primary;
}
abstract class HskDisabledButtonBorderColors{
  HskColors get primary;
}
