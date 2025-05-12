
import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';


// đặc điểm: text button, có màu nền theo primary hoặc truyền vào, không có border
class HskTextButtonType1 extends StatelessWidget {
  
  final double? verticalPadding;
  final double? horizontalPadding;
  final EdgeInsets? margin;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final String label;


  const HskTextButtonType1({
    super.key,
    this.verticalPadding,
    this.margin,
    this.horizontalPadding,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    final resolvedVerticalPadding = verticalPadding ?? ms.button.size.base.small.vertical;
    final resolvedHorizontalPadding =
        horizontalPadding ?? ms.button.size.base.small.horizontal;
    final resolvedBackgroundColor = backgroundColor ??
        cs.semantic.primaryColor.byMode(isDarkMode);
    final resolvedTextColor = textColor ?? cs.semantic.foregroundColor.byMode(isDarkMode);
    final resolvedMargin = margin ?? EdgeInsets.all(0);
    final baseStyle = TextButtonTheme.of(context).style;
    return Container(
        margin: resolvedMargin,
        child: TextButton(
          onPressed: onPressed,
          style: baseStyle?.copyWith(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                // Lấy lại đúng màu disabled từ theme
                return baseStyle.backgroundColor?.resolve(states);
              }
              // Nếu enabled → dùng màu bạn muốn override
              return resolvedBackgroundColor;
            }),
            foregroundColor: HskButtonColorUtils.resolveByState(
              normal: resolvedTextColor,
              disabled: cs.button.foreground.disabled.primary.byMode(isDarkMode),
              hovered: resolvedTextColor,
              selected: resolvedTextColor,
            ),
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: resolvedVerticalPadding, horizontal: resolvedHorizontalPadding),
            ),
           
          ),
          child: FittedBox(fit: BoxFit.scaleDown, child: Text(label)),
        ));
  }
}
