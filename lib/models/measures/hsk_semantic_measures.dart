

import 'package:flutter/material.dart';

abstract class HskSemanticMeasures {
  //----------------------text-------------------------------
  //1. Header
  double get fsHeadlineLarge;
  double get fsHeadlineMedium;
  double get fsHeadlineSmall;

  double get lspHeadlineLarge;
  double get lspHeadlineMedium;
  double get lspHeadlineSmall;

  //2. Body, Button
  double get fsBodyLarge;
  double get fsBodyMedium;
  double get fsBodySmall;

  double get lspBody;

  //3. Label
  double get fsLabelLarge;
  double get fsLabelMedium;
  double get fsLabelSmall;

  double get lspLabel;

  //button
  //1. size
  double get elementVerticalPadding;
  double get blockVerticalPadding;
  double get sectionVerticalPadding;

  double get elementHorizontalPadding;
  double get blockHorizontalPadding;
  double get sectionHorizontalPadding;

  //-------------------border-radius--------------------
  BorderRadius get baseBorderRadius;

  //------------------border-width---------------------
  double get borderWidth;

  //-------------------overlay-opacity------------------
  double get overlayOpacity;
}
