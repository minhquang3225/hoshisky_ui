import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/widgets/text/hsk_fixed_label.dart';
/// 1. Các tham số bắt buộc, onPressed, label
/// 2. Các tham số khác
/// a. Margin: Quản lí khoảng cach với button
/// b. Padding: Padding cho button
/// c. BackgroundColor: Dựa trên cs.button.background + hoặc truyền vào, nếu disabled, thì sẽ có opacityDisabledTheo backgroundColor
/// d. OverlayColor: Mặc định là white, có thể truyền vào

class HskCircleIconButtonPrimaryFlat extends StatelessWidget {
  final EdgeInsets? margin;
  final double? padding;
  final VoidCallback? onPressed;
  final HskFixedIconLabel label;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double? disabledOpacity;

  const HskCircleIconButtonPrimaryFlat({
    super.key,
    required this.onPressed,
    required this.label,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.overlayColor = white,
    this.disabledOpacity = 0.1,
  });
  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;
    final resolvedPadding = padding ?? ms.button.size.base.medium.vertical;
    final resolvedBackgroundColor = onPressed != null ? (backgroundColor ?? cs.button.background.base.primary.byMode(isDarkMode)):(backgroundColor?.withValues(alpha: disabledOpacity)?? cs.button.background.base.primary.byMode(isDarkMode).withValues(alpha: disabledOpacity));
    final resolvedLabel = onPressed != null ? label : label.copyWith(isDisabled: true);
    print('✅ \x1B[32m Padding $resolvedPadding \x1B[0m');
    return Container( 
        margin: margin,                               //margin null không gây lỗi vì EdgeInsetGeometrys là một nullabled widget
        child: IconButton(
            style: IconButton.styleFrom(
                padding: EdgeInsets.all(resolvedPadding+100),
                backgroundColor: resolvedBackgroundColor,
                overlayColor: overlayColor,

                ),
            onPressed: onPressed,
            icon: resolvedLabel));
  }
}
