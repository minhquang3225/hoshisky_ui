import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';


class HskOutlinedTextButtonType1 extends StatelessWidget {

  late EdgeInsets? margin;
  final VoidCallback? onPressed;
  final String label;
  late Color? backgroundColor;
  late Color? borderColor;  
  double? buttonElevation ;
  late double? borderWidth;
  late Color? textColor;
  late double? verticalPadding;
  late double? horizontalPadding;

  HskOutlinedTextButtonType1({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
    this.buttonElevation ,
    this.margin,
    this.borderWidth,
    this.verticalPadding,
    this.horizontalPadding,

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
        textColor ?? cs.button.foreground.base.primary.byMode(isDarkMode);
    verticalPadding = verticalPadding ?? ms.button.size.base.small.vertical;
    horizontalPadding = horizontalPadding ?? ms.button.size.base.small.horizontal;
    borderWidth = borderWidth ?? ms.buttonBorderWidth;
    margin = margin ?? EdgeInsets.all(0);
    final overlayColor = textColor!.withValues(alpha: cs.semantic.overlayOpacity);
    final baseStyle = OutlinedButtonTheme.of(context).style;
    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: baseStyle!.copyWith(
         
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          foregroundColor: HskButtonColorUtils.overrideStates(
          base: WidgetStatePropertyAll(
              baseStyle.backgroundColor?.resolve({}) ??
                  Colors.transparent),
          normal: textColor,
          disabled: textColor!.withValues(alpha: 0.4),
        ),
          overlayColor: WidgetStatePropertyAll(overlayColor),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: verticalPadding!, horizontal: horizontalPadding!),
            ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label)),
      ),
    );
  }
}
