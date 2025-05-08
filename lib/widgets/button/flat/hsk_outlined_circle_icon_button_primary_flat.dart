import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/widgets/text/hsk_fixed_label.dart';

/// 1. Các tham số bắt buộc, onPressed, label
/// 2. Các tham số khác
/// a. Margin: Quản lí khoảng cach với button
/// b. Padding: Padding cho button
/// c. BackgroundColor: Dựa trên cs.button.background + hoặc truyền vào, nếu disabled, thì sẽ có opacityDisabledTheo backgroundColor
/// d. OverlayColor: Mặc định là white, có thể truyền vào

class HskOutlinedCircleIconButtonPrimaryFlat extends StatelessWidget {
  final HskFixedIconLabel label;
  final VoidCallback? onPressed;
  final EdgeInsets? margin;
  final double? padding;
  final Color? backgroundColor;
  final double? backgroundOpacity;
  final Color? overlayColor;
  final double? disabledOpacity;
  final Color? borderColor;
  final BorderSide? side;

  const HskOutlinedCircleIconButtonPrimaryFlat({
    super.key,
    required this.label,
    required this.onPressed,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.overlayColor,
    this.disabledOpacity = 0.1,
    this.backgroundOpacity = 0.15,
    this.side,
  });
  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    final resolvedPadding = padding ?? ms.button.size.base.medium.horizontal;
    final resolvedBorderColor =
        borderColor ?? cs.semantic.primaryColor.byMode(isDarkMode);
    final resolvedBackgroundColor = onPressed == null
        ? backgroundColor?.withValues(alpha: disabledOpacity) ??
            resolvedBorderColor.withValues(alpha: disabledOpacity)
        : backgroundColor?.withValues(alpha: backgroundOpacity??0) ??
            resolvedBorderColor.withValues(alpha: backgroundOpacity??0);
    final resolvedOverlayColor = overlayColor ?? resolvedBorderColor;
    final resolvedLabel =
        onPressed != null ? label : label.copyWith(isDisabled: true);

    final resolvedSide = onPressed != null
        // Nếu nút có thể nhấn (onPressed != null)
        ? (side ??
            ms.button.side.base.primary.style.copyWith(
              color:
                  resolvedBorderColor, // Nếu không có side, sử dụng giá trị mặc định với color là resolvedBorderColor
            ))
        // Nếu nút không thể nhấn (onPressed == null)
        : (side != null
            // Nếu side có giá trị (không phải null)
            ? (side?.color != null
                // Nếu side có màu (side.color không phải null)
                ? side!.copyWith(
                    color: side!.color.withValues(
                        alpha: cs.semantic
                            .disabledOpacity), // Giảm độ trong suốt của màu của side
                  )
                // Nếu side không có màu (side.color là null)
                : side!.copyWith(
                    color: resolvedBorderColor.withValues(
                        alpha: cs.semantic
                            .disabledOpacity), // Sử dụng resolvedBorderColor và giảm độ trong suốt
                  ))
            // Nếu side là null
            : ms.button.side.base.primary.style.copyWith(
                color: resolvedBorderColor.withValues(
                    alpha: cs.semantic
                        .disabledOpacity), // Sử dụng resolvedBorderColor mặc định với độ trong suốt giảm
              ));
    return Container(
        margin:
            margin, //margin null không gây lỗi vì EdgeInsetGeometrys là một nullabled widget
        child: IconButton(
            style: IconButton.styleFrom(
              padding: EdgeInsets.all(resolvedPadding),
              backgroundColor: resolvedBackgroundColor,
              overlayColor: resolvedOverlayColor,
              side: resolvedSide,
            ),
            onPressed: onPressed,
            icon: resolvedLabel));
  }
}
