import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/widgets/text/hsk_fixed_label.dart';


//Quy tắc: Càng truyền ít tham số càng tốt
/// Đặc điểm
/// 1. Đầy đủ theo file flat_button_instruction
/// 2. Background Color có nền mờ - mặc định theo ms.button.background.base.primary.withValue(backgroundOpacity) nếu không thì truyền vào
/// 4. overlayColor - truyền vào mặc định là trắng, phụ thuộc vào background Color
/// 5. disabledBackground  - dựa theo background color
/// 6. marign - 0
/// 7. label (nhãn của button) truyền vào - khi press thì chuyển chữ trắng
/// 8. horizontalPadding (double) mặc định sử dụng ms.button.size.base.medium
/// 9. verticalPadding (double) * 2 + lableHeight => ra chiều cao của button sử dụng ms.button.size.base.medium.

class HskTextButtonSecondaryFlat extends StatelessWidget {
  final HskFixedTextLabel label;
  final VoidCallback? onPressed;

  final EdgeInsets? margin;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final double? backgroundOpacity;
  final Color? overlayColor;
  final double? disabledOpacity;

  const HskTextButtonSecondaryFlat({
    super.key,
    required this.label,
    required this.onPressed,
    this.margin,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    this.overlayColor,
    this.disabledOpacity = 0.1,
    this.backgroundOpacity = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

  print('✅ \x1B[32m $backgroundOpacity \x1B[0m');
   final resolvedBackgroundColor = onPressed == null
        ? backgroundColor?.withValues(alpha: disabledOpacity) ?? cs.semantic.primaryColor.byMode(isDarkMode).withValues(alpha: disabledOpacity)   // Khi onPressed null, sử dụng màu xanh làm background
        : backgroundColor?.withValues(alpha: backgroundOpacity) ?? cs.semantic.primaryColor.byMode(isDarkMode).withValues(alpha: backgroundOpacity);

    final resolvedOverlayColor = overlayColor ?? resolvedBackgroundColor;
    final resolvedHorizontalPadding =
        horizontalPadding ?? ms.button.size.base.medium.horizontal;
    final resolvedVerticalPadding =
        verticalPadding ?? ms.button.size.base.medium.vertical;
    // Gán isDisabled trực tiếp cho label (sử dụng copyWith để không mất state khác)
    final effectiveLabel = label.copyWith(isDisabled: onPressed == null);
    print('✅ \x1B[32m Padding $resolvedVerticalPadding x $resolvedHorizontalPadding\x1B[0m');
    return Container(
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: resolvedHorizontalPadding,
            vertical: resolvedVerticalPadding,
          ),
          backgroundColor: resolvedBackgroundColor,
          overlayColor: resolvedOverlayColor,
          side: BorderSide(
            color: Colors.red,
            width: 1,
          )
        ),
        child: effectiveLabel,
      ),
    );
  }
}
