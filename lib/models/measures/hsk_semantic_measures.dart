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

  //1. size (fixeheight / padding height)

  //-------1a. text  (text in button)
  double get labelHeight;

  //-------1b. element (button, input)
  double get elementVerticalPadding; //padding phần tử cấp Element (button,....)
  double get elementHorizontalPadding;


  //-------1c. block (appbar)

  //-------1d. section

  //-------1e. page

  //-------------------border-radius--------------------
  BorderRadius get baseBorderRadius;

  //------------------border-width---------------------
  double get borderWidth;

  //-------------------overlay-opacity------------------
  double get overlayOpacity;
}
