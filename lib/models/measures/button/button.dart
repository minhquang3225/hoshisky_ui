import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/themes/hsk_ordinal.dart';
import 'package:hoshisky_ui/models/themes/hsk_size.dart';
import 'package:hoshisky_ui/models/themes/hsk_state.dart';
import 'package:hoshisky_ui/models/themes/hsk_style.dart';

abstract class HskButtonMeasures{
  HskState<HskOrdinal<HskStyle<ShapeBorder>>> get shape;
  HskState<HskSize<HskStyle<TextStyle>>> get font;  //loại bỏ trong tương lai
  HskState<HskOrdinal<HskStyle<BorderSide>>> get side;
  HskState<HskSize<HskButtonSize>> get size;
}

abstract class HskButtonSize {
  double get vertical;
  double get horizontal;
  double get labelHeight;
}