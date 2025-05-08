import 'package:flutter/material.dart';

abstract class HskButtonFonts {
  HskBaseButtonFonts get base;
  
}

abstract class HskBaseButtonFonts {
  HskPropsButtonFont get small;
  HskPropsButtonFont get medium;
  HskPropsButtonFont get large;
}


abstract class HskPropsButtonFont{
  TextStyle get style;
}


