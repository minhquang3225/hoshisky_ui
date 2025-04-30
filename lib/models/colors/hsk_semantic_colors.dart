import 'package:flutter/material.dart';

abstract class HskSemanticColors {
  Color get primaryColor;
  Color get primaryLightColor;
  Color get primaryDarkColor;
  Color get darkModePrimaryColor;
  Color get darkModePrimaryLightColor;
  Color get darkModePrimaryDarkColor;

  Color get secondaryColor;
  Color get secondaryLightColor;
  Color get secondaryDarkColor;
  Color get darkModeSecondaryColor;
  Color get darkModeSecondaryLightColor;
  Color get darkModeSecondaryDarkColor;

  Color get disabledBackgroundColor;

  Color get darkModeDisabledBackgroundColor;


  Color get errorColor;

  Color get darkModeErrorColor;


  Color get successColor;

  Color get darkModeSuccessColor;


  Color get warningColor;

  Color get darkModeWarningColor;

  Color get infoColor;
  Color get darkModeInfoColor;
}