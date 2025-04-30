import 'package:flutter/material.dart';

abstract class HskButtonSides {
  HskBaseButtonSides get base;
}

abstract class HskBaseButtonSides {
  HskPrimaryBaseButtonSide get primary;
}

abstract class HskPrimaryBaseButtonSide{
  BorderSide get style;
}