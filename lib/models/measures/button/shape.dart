
import 'package:hoshisky_ui/models/measures/hsk_button_state.dart';

abstract class HskButtonShapes extends HskButtonState {
}

abstract class HskBaseButtonShapes {
  HskPrimaryBaseButtonShape get primary;
}

abstract class HskPrimaryBaseButtonShape{
  dynamic get style;
}