import 'package:hoshisky_ui/models/measures/button/font.dart';
import 'package:hoshisky_ui/models/measures/button/shape.dart';
import 'package:hoshisky_ui/models/measures/button/side.dart';
import 'package:hoshisky_ui/models/measures/button/size.dart';

abstract class HskButtonMeasures{
  HskButtonShapes get shape;
  HskButtonFonts get font;
  HskButtonSides get side;
  HskButtonSizes get size;
}