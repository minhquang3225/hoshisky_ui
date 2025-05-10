import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/measures/hsk_button_state.dart';

abstract class HskButtonFonts extends HskButtonState {
  
}

abstract class HskBaseButtonFonts {
  HskPropsButtonFont get small;
  HskPropsButtonFont get medium;
  HskPropsButtonFont get large;
}


abstract class HskPropsButtonFont{
  TextStyle get style;
}


