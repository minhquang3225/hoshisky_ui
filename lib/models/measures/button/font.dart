import 'package:flutter/material.dart';

abstract class HskButtonFonts {
  HskBaseButtonFonts get base;
}

abstract class HskBaseButtonFonts {
  HskPrimaryBaseButtonFont get primary;
}

abstract class HskPrimaryBaseButtonFont{
  TextStyle get style;
}