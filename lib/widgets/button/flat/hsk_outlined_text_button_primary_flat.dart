//Quy tắc: Càng truyền ít tham số càng tốt
import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/widgets/text/hsk_fixed_label.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';

/// Đặc điểm
/// 1. Đầy đủ theo file flat_button_instruction
/// 10. borderColor: dựa vào  hoặc có thể truyền vào tự do (đôi khi màu chữ truyển vào có thể khác nhau)
/// 
/// 2. Background Color có nền trong suốt hoặc mở - mặc định theo borderColor nếu không thì truyền vào đồng bộ backgroundColor theo borderColor, giá trị sẽ là cs.semantic.primaryClor
/// 4. overlayColor - truyền vào mặc định là trắng, phụ thuộc vào background Color
/// 5. disabledBackground  - dựa theo background color mà chỉnh opacity xuống
/// 6. marign - 0
/// 7. label (nhãn của button) truyền vào - khi press thì chuyển chữ trắng
/// 8. horizontalPadding (double) mặc định sử dụng ms.button.size.base.medium
/// 9. verticalPadding (double) * 2 + lableHeight => ra chiều cao của button sử dụng ms.button.size.base.medium.
/// 11. disabledOpacity: Điều chỉnh background cho phù hợp với từng màu
/// 12. side: có thể truyền vào (xác định các thuộc tính width, borderColor) - borderColor khi bị disable phải giảm bớt opacity


class HskOutlinedTextButtonPrimaryFlat extends StatelessWidget {
  final HskFixedTextLabel label;
  final VoidCallback? onPressed;

  final EdgeInsets? margin;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final double? backgroundOpacity;
  final Color? overlayColor;
  final double? disabledOpacity;
  final Color? borderColor;
  final BorderSide? side;

  const HskOutlinedTextButtonPrimaryFlat({
    super.key,
    required this.label,
    required this.onPressed,
    this.margin,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    this.borderColor,
    this.overlayColor,
    this.disabledOpacity = 0.1,
    this.backgroundOpacity = 0.5,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;
    final resolvedBorderColor = borderColor ?? cs.semantic.primaryColor.byMode(isDarkMode);
   final resolvedBackgroundColor = onPressed == null
        ? backgroundColor?.withValues(alpha: disabledOpacity) ?? resolvedBorderColor.withValues(alpha: disabledOpacity)   
        : backgroundColor?.withValues(alpha: backgroundOpacity) ?? resolvedBorderColor.withValues(alpha: backgroundOpacity);

    final resolvedOverlayColor = overlayColor ?? borderColor;
    final resolvedHorizontalPadding =
        horizontalPadding ?? ms.button.size.base.medium.horizontal;
    final resolvedVerticalPadding =
        verticalPadding ?? ms.button.size.base.medium.vertical;
    // Gán isDisabled trực tiếp cho label (sử dụng copyWith để không mất state khác)
    final effectiveLabel = label.copyWith(isDisabled: onPressed == null);
    final resolvedSide = onPressed != null
    // Nếu nút có thể nhấn (onPressed != null)
    ? (side ?? ms.button.side.base.primary.style.copyWith(
        color: resolvedBorderColor, // Nếu không có side, sử dụng giá trị mặc định với color là resolvedBorderColor
      ))
    // Nếu nút không thể nhấn (onPressed == null)
    : (side != null
        // Nếu side có giá trị (không phải null)
        ? (side?.color != null
            // Nếu side có màu (side.color không phải null)
            ? side!.copyWith(
                color: side!.color.withValues(alpha: cs.semantic.disabledOpacity), // Giảm độ trong suốt của màu của side
              )
            // Nếu side không có màu (side.color là null)
            : side!.copyWith(
                color: resolvedBorderColor.withValues(alpha: cs.semantic.disabledOpacity), // Sử dụng resolvedBorderColor và giảm độ trong suốt
              ))
        // Nếu side là null
        : ms.button.side.base.primary.style.copyWith(
            color: resolvedBorderColor.withValues(alpha: cs.semantic.disabledOpacity), // Sử dụng resolvedBorderColor mặc định với độ trong suốt giảm
          ));

    return Container(
      margin: margin,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: resolvedHorizontalPadding,
            vertical: resolvedVerticalPadding,
          ),
          backgroundColor: resolvedBackgroundColor,
          overlayColor: resolvedOverlayColor,
          side: resolvedSide
        ),
        child: effectiveLabel,
      ),
    );
  }
}

