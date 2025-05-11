import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/widgets/text/hsk_fixed_label.dart';
/// 1. Các tham số bắt buộc, onPressed, label
/// 2. Các tham số khác
/// a. Margin: Quản lí khoảng cach với button
/// b. Padding: Padding cho button
/// c. BackgroundColor: Dựa trên cs.button.background + hoặc truyền vào, nếu disabled, thì sẽ có opacityDisabledTheo backgroundColor
/// d. OverlayColor: Mặc định là white, có thể truyền vào

class HskCircleIconButtonSecondaryFlat extends StatelessWidget {
  final EdgeInsets? margin;
  final double? padding;
  final VoidCallback? onPressed;
  final HskFixedIconLabel label;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double? disabledOpacity;
  final double? backgroundOpacity;

  const HskCircleIconButtonSecondaryFlat({
    super.key,
    required this.onPressed,
    required this.label,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.overlayColor,
    this.disabledOpacity,
    this.backgroundOpacity
  });
  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;
    final resolvedBackgroundOpacity = backgroundOpacity ?? 0.15;   
    final resolvedPadding = padding ?? ms.button.size.base.medium.horizontal;
    final resolvedBackgroundColor = onPressed != null ? (backgroundColor?.withValues(alpha: resolvedBackgroundOpacity)  ?? cs.button.background.base.primary.byMode(isDarkMode).withValues(alpha: resolvedBackgroundOpacity) ):(backgroundColor?.withValues(alpha: disabledOpacity)?? cs.button.background.base.primary.byMode(isDarkMode).withValues(alpha: disabledOpacity));
     final resolvedOverlayColor = overlayColor ?? resolvedBackgroundColor;
    final resolvedLabel = onPressed != null ? label : label.copyWith(isDisabled: true);
    return Container( 
        margin: margin,                               //margin null không gây lỗi vì EdgeInsetGeometrys là một nullabled widget
        child: IconButton(
            style: IconButton.styleFrom(
                padding: EdgeInsets.all(resolvedPadding),
                backgroundColor: resolvedBackgroundColor,
                overlayColor: resolvedOverlayColor,
                ),
            onPressed: onPressed,
            icon: resolvedLabel));
  }
}
