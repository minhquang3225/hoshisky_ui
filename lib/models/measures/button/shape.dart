import 'package:flutter/material.dart';

abstract class HskButtonShapes {
  HskBaseButtonShapes get base;
}

abstract class HskBaseButtonShapes {
  HskPrimaryBaseButtonShape get primary;
}

abstract class HskPrimaryBaseButtonShape{
  dynamic get style;
}