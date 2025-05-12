import 'package:hoshisky_ui/models/measures/font/hsk_font_weight.dart';
import 'package:hoshisky_ui/models/themes/hsk_size.dart';
import 'package:hoshisky_ui/models/themes/hsk_state.dart';

abstract class HskFontSizeRole {
  HskState<HskSize<double>> get label;
  HskState<HskSize<double>> get headline;
  HskState<HskSize<double>> get body;
}

abstract class HskFontWeightRole{
  HskState<HskFontWeight> get label;
  HskState<HskFontWeight> get headline;
  HskState<HskFontWeight> get body;
}

abstract class HskFontSpaceRole{
  HskState<HskSize<double>> get label;
  HskState<HskSize<double>> get headline;
  HskState<HskSize<double>> get body;
}

