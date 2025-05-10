import 'package:hoshisky_ui/models/measures/hsk_button_state.dart';

abstract class HskButtonSizes extends HskButtonState {}

abstract class HskBaseButtonSizes {
  HskSmallBaseButtonSize get small;
  HskSmallBaseButtonSize get medium;
  HskSmallBaseButtonSize get large;
}

abstract class HskSmallBaseButtonSize {
  double get vertical;
  double get horizontal;
  double get labelHeight;
}