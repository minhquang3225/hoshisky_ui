import 'package:flutter/material.dart';
import 'package:hoshisky_ui/models/colors/button/hsk_button_colors.dart';
import 'package:hoshisky_ui/models/colors/hsk_colors.dart';
import 'package:hoshisky_ui/models/colors/hsk_semantic_colors.dart';

abstract class HskColorScheme {
  HskButtonColors get button;
  HskSemanticColors get semantic;
  //-------------------------------base - color----------------
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

  Color get disabledColor;
  Color get darkModeDisabledColor;
  
  //-------------------------------base - background----------------
  Color get backgroundColor;
  Color get darkModeBackgroundColor;
  Color get surfaceColor;
  Color get surfaceDarkColor;
  Color get darkModeSurfaceColor;
  Color get darkModeSurfaceLightColor;
  Color get appBarBackgroundColor;
  Color get darkModeAppBarBackgroundColor;
  Color get disabledSurfaceBackgroundColor;
  Color get darkModeDisabledSurfaceBackgroundColor;
  
//-------------------------------base - text----------------
  Color get primaryTextColor;                //text
  Color get secondaryTextColor;           
  Color get darkModePrimaryTextColor;         
  Color get darkModeSecondaryTextColor;      
  Color get surfaceTextColor;               //text surface (on button, on card ...)
  Color get darkModeSurfaceTextColor;   
  Color get disabledTextColor;              //disabledTextColor chung
  Color get darkModeDisabledTextColor;      
  

  //-----------------------------------text----------------


  Color get appBarTextColor;         //appBar text
  Color get darkModeAppBarTextColor;      

  Color get headlinePrimaryTextColor;           //headline text
  Color get textColorHeadlineSecondary;         
  Color get darkModeHeadlinePrimaryTextColor;   
  Color get darkModeSecondaryHeadlineTextColor; 

  Color get primaryIconColor;                  //icon
  Color get darkModePrimaryIconColor;
  Color get secondaryIconColor;
  Color get darkModeSecondaryIconColor;
  Color get tertiaryIconColor;
  Color get darkModeTertiaryIconColor;
  Color get disabledIconColor;
  Color get darkModeDisabledIconColor;
  
  Color get errorColor;
  Color get errorLightColor;
  Color get errorDarkColor;
  Color get warningColor;
  
  Color get borderColor;
  Color get darkModeBorderColor;
  Color get dividerColor;
  Color get darkModeDividerColor;
  
  Color get inputBackgroundColor;
  Color get darkModeInputBackgroundColor;
  Color get placeholderColor;
  Color get darkModePlaceholderColor;

//-------------------------------button----------------

//1. base

  Color get buttonBackgroundColor;  //backgroundColor
  Color get darkModeButtonBackgroundColor;

  Color get buttonTextColor;   //text
  Color get darkModeButtonTextColor;

  Color get buttonBorderColor; //border
  Color get darkModeButtonBorderColor;


//2. customize  


  // Color get secondaryButtonBackgroundColor;
  // Color get tertiaryButtonBackgroundColor;
  // Color get darkModeSecondaryButtonBackgroundColor;
  // Color get darkModeTertiaryButtonBackgroundColor;
  Color get overlayColor;
  Color get darkModeOverlayColor;
  Color get disabledButtonBackgroundColor;
  Color get darkModeDisabledButtonBackgroundColor;
  Color get buttonBackgroundPressedColor;
  Color get darkModeButtonBackgroundPressedColor;

  Color get primaryButtonBorderColor;    //border color
  Color get secondaryButtonBorderColor;
  Color get tertiaryButtonBorderColor;
  Color get darkModePrimaryButtonBorderColor;
  Color get darkModeSecondaryButtonBorderColor;
  Color get darkModeTertiaryButtonBorderColor;

  Color get primaryButtonTextColor;
  Color get darkModePrimaryButtonTextColor;
  Color get secondaryButtonTextColor;
  Color get darkModeSecondaryButtonTextColor;
  Color get tertiaryButtonTextColor;
  Color get darkModeTertiaryButtonTextColor;

//-----------------------------------shadow----------------
  Color get shadowColor;
  Color get darkModeShadowColor;
}