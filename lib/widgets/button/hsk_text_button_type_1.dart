import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';


// đặc điểm: text button, có màu nền theo primary hoặc truyền vào, không có border
class HskTextButtonType1 extends StatelessWidget {
  
  late double? verticalPadding;
  late double? horizontalPadding;
  late EdgeInsets? margin;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? textColor;
  final String buttonTitle;


  HskTextButtonType1({
    super.key,
    this.verticalPadding,
    this.margin,
    this.horizontalPadding,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.textColor,
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
        cs.semantic.primaryColor.byMode(isDarkMode);
    textColor = textColor ?? cs.semantic.foregroundColor.byMode(isDarkMode);
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
            foregroundColor: HskButtonColorUtils.resolveByState(
              normal: textColor!,
              disabled: cs.button.foreground.disabled.primary.byMode(isDarkMode),
              hovered: textColor!,
              selected: textColor!,
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
