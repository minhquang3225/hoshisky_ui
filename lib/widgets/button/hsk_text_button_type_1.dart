import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/utils/get_button_color.dart';

// đặc điểm: text button, có màu nền theo primary hoặc truyền vào, không có border
class HskTextButtonType1 extends StatelessWidget {
  late double? verticalPadding;
  late double? horizontalPadding;
  late EdgeInsets? margin;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? textColor;
  final String buttonTitle;

  // late Color? overlayColor;

  HskTextButtonType1({
    super.key,
    this.verticalPadding,
    this.margin,
    this.horizontalPadding,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.textColor,
    // this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    verticalPadding = verticalPadding ?? ms.textButtonVerticalPaddingSmall;
    horizontalPadding =
        horizontalPadding ?? ms.textButtonHorizontalPaddingSmall;
    backgroundColor = backgroundColor ??
        (!isDarkMode
            ? cs.button.background.baseLight
            : cs.button.background.baseDark);
    textColor = textColor ??
        (!isDarkMode ? cs.buttonTextColor : cs.darkModeButtonTextColor);
    margin = margin ?? EdgeInsets.all(0);
    final baseStyle = TextButtonTheme.of(context).style;
    return Container(
        margin: margin,
        child: TextButton(
          onPressed: onPressed,
          style: baseStyle?.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                // Lấy lại đúng màu disabled từ theme
                return baseStyle.backgroundColor?.resolve(states);
              }
              // Nếu enabled → dùng màu bạn muốn override
              return backgroundColor;
            }),
            foregroundColor: getButtonColor(
              normalColor: textColor!,
              disabledColor: !isDarkMode
                  ? cs.button.foreground.baseLight
                  : cs.button.foreground.baseDark,
              hoveredColor: textColor!,
              selectedColor: textColor!,
              pressedColor: textColor!,
            ),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: verticalPadding!, horizontal: horizontalPadding!),
            ),
           
          ),
          child: FittedBox(fit: BoxFit.scaleDown, child: Text(buttonTitle)),
        ));
  }
}
