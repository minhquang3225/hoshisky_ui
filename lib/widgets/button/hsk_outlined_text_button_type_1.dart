import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/utils/get_button_color.dart';


class HskOutlinedTextButtonType1 extends StatelessWidget {

  late EdgeInsets? margin;
  final VoidCallback? onPressed;
  final String buttonTitle;
  late Color? backgroundColor;
  late Color? borderColor;  
  double? buttonElevation ;
  late double? borderWidth;
  late Color? textColor;

  HskOutlinedTextButtonType1({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.textColor,
    this.buttonElevation ,
    this.margin,
    this.borderWidth,

    @Deprecated("Chọn HskWidget khác hoặc thay đổi trong ButtonThemeData")
    this.borderColor,
     @Deprecated("Chọn HskWidget khác hoặc thay đổi trong ButtonThemeData")
    this.backgroundColor,

    
  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    
    backgroundColor = backgroundColor??transparent;
    textColor =
        textColor ?? (!isDarkMode ? cs.semantic.primaryColor : cs.semantic.darkModePrimaryColor);
 
    borderWidth = borderWidth ?? ms.buttonBorderWidth;
    margin = margin ?? EdgeInsets.all(0);
    final baseStyle = OutlinedButtonTheme.of(context).style;
    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: baseStyle!.copyWith(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(buttonTitle)),
      ),
    );
  }
}
