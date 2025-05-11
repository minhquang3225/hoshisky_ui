import 'package:hoshisky_ui/models/measures/button/font.dart';
import 'package:hoshisky_ui/models/measures/button/shape.dart';
import 'package:hoshisky_ui/models/measures/button/side.dart';
import 'package:hoshisky_ui/models/measures/button/size.dart';
import 'package:hoshisky_ui/models/measures/hsk_ordinal_measures.dart';
import 'package:hoshisky_ui/models/measures/hsk_size_measures.dart';

abstract class HskButtonMeasures{
  HskOrdinalMeasures get shape;
  HskSizeMeasures get font;
  HskOrdinalMeasures get side;
  HskSizeMeasures get size;
}