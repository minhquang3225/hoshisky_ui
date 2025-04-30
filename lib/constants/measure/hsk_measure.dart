import 'package:flutter/material.dart';

abstract class HskMeasure {
  // Border
  double get round;
  Radius get radius;
  BorderRadius get borderRadius;
  WidgetStateProperty<OutlinedBorder> get outlineRoundedBorderRadius;
  double get borderWidth;
  double get inputBorderWidth;
  double get buttonBorderWidth;
  WidgetStateProperty<BorderSide> get borderButtonStyle;
  // Padding & Margin
  WidgetStateProperty<EdgeInsetsGeometry> get padding;

  // Divider
  double get dividerThickness;
  double get dividerSpace;
  double get indent;
  double get endIndent;
  BorderRadius get dividerRounded;

  // Spacing
  double get spacingToTopDevice;
  double get spacingToBottomDevice;
  double get spacingHorizontalDevice;
  EdgeInsets get spacingDevice;

  double get spacingByPaddingSmall;
  double get spacingByMarginSmall;
  EdgeInsets get spacingBottomHeadlineSmall;    //padding bottom widget Header
  EdgeInsets get spacingBottomTitleLarge;       //padding bottom widget Title(bao gồm Header trong đó
  EdgeInsets get spacingBottomComponentLarge;   
  EdgeInsets get spacingBottomComponentMedium;
  EdgeInsets get spacingBottomInputSmall;

  // Box
  double get minBoxHeight;
  EdgeInsets get boxPaddingSmall;             
  EdgeInsets get boxPaddingMedium;
  EdgeInsets get boxPaddingLarge;

  // Section
  EdgeInsets get sectionBottomMarginSmall;     //khoảng cách với phần tử bên dưới
  EdgeInsets get sectionBottomMarginMedium;
  EdgeInsets get sectionBottomMarginLarge;

  // Text
  double get fsHeadlineLarge;  //fontsize
  double get fsHeadlineMedium;
  double get fsHeadlineSmall;
  FontWeight get fwHeadlineLarge; //fontbold
  FontWeight get fwHeadlineMedium;
  FontWeight get fwHeadlineSmall;
  double get lspHeadlineLarge;    //letter spacing
  double get lspHeadlineMedium;
  double get lspHeadlineSmall;

  double get fsBodyLarge; 
  double get fsBodyMedium;
  double get fsBodySmall;
  FontWeight get fwBodyLarge;
  FontWeight get fwBodyMedium;
  FontWeight get fwBodySmall;
  double get lspBody;

  double get fsLabelLarge;
  double get fsLabelMedium;
  double get fsLabelSmall;
  FontWeight get fwLabelLarge;
  FontWeight get fwLabelMedium;
  FontWeight get fwLabelSmall;
  double get lspLabel;

  double get fsIconSmall;
  double get fsIconMedium;
  double get fsIconLarge;

  // Elevation
  double get elevation;
  double get cardElevation;
  double get buttonElevation;
  double get iconButtonElevation;



  // Input
  double get inputHeightSmall;
  double get inputButtonWidthSmall;
  double get inputButtonHeightSmall;

  //-----------------------buttton--------------------

//base
  //1. padding (height and width)
  double get buttonVerticalPaddingSmall;
  double get buttonHorizontalPaddingSmall;
  double get buttonVerticalPaddingMedium;
  double get buttonHorizontalPaddingMedium;
  double get buttonVerticalPaddingLarge;
  double get buttonHorizontalPaddingLarge;

  // Customize
  double get iconButtonVerticalPaddingSmall;  // Icon button
  double get iconButtonHorizontalPaddingSmall;
  double get iconButtonVerticalPaddingMedium;
  double get iconButtonHorizontalPaddingMedium;
  double get iconButtonVerticalPaddingLarge;
  double get iconButtonHorizontalPaddingLarge;

  double get textButtonVerticalPaddingSmall;   // Text button
  double get textButtonHorizontalPaddingSmall;
  double get textButtonVerticalPaddingMedium;
  double get textButtonHorizontalPaddingMedium;
  double get textButtonVerticalPaddingLarge;
  double get textButtonHorizontalPaddingLarge;
  
}
