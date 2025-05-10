import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/measures/hsk_button_state.dart';

abstract class HskButtonSides extends HskButtonState {
}

abstract class HskBaseButtonSides {
  HskPrimaryBaseButtonSide get primary;
}

abstract class HskPrimaryBaseButtonSide{
  BorderSide get style;
}