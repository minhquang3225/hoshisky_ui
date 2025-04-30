import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/borders/border-width.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HskCircleIconButtonType3 extends StatelessWidget {
  late double? buttonWidth;
  late double? buttonHeight;
  late double? marginBottom;
  final Icon icon;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? iconColor;
  late Color? borderColor;
  late double? iconSize;
  EdgeInsetsGeometry? iconPadding;
  double? iconButtonElevation;
  late double? borderWidth;
  late Color? overlayColor;

  HskCircleIconButtonType3({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.borderColor,
    this.iconPadding,
    this.iconSize,
    this.iconButtonElevation,
    this.marginBottom,
    this.borderWidth,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    buttonWidth = buttonWidth ?? ms.button.size.base.primary.horizontal;
    marginBottom = marginBottom ?? 0;
    buttonHeight = buttonHeight ?? ms.button.size.base.primary.vertical;
    backgroundColor =
        backgroundColor ?? transparent;
    iconButtonElevation = iconButtonElevation ?? ms.iconButtonElevation;
    iconColor = iconColor ?? cs.semantic.primaryColor.byMode(isDarkMode);
    iconSize = iconSize ?? ms.fsIconMedium;
    borderColor = borderColor ?? (!isDarkMode ? gray400 : gray700);
    borderWidth = borderWidth ?? 1;
    iconPadding = EdgeInsets.all(ms.button.size.base.primary.vertical);
    marginBottom = marginBottom ?? 0;
    overlayColor = iconColor!.withValues(alpha: ms.semantic.overlayOpacity);
    final baseStyle = IconButtonTheme.of(context).style;
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom!),
      child: IconButton(
        onPressed: onPressed,
        iconSize: baseStyle?.iconSize?.resolve({}) ?? 24.0, // Kích thước của icon
        padding: iconPadding, // Loại bỏ padding mặc định của IconButton
        style:  baseStyle!.copyWith(
          foregroundColor: HskButtonColorUtils.overrideStates(
          base: WidgetStatePropertyAll(
              baseStyle.backgroundColor?.resolve({}) ??
                  Colors.transparent),
          normal: iconColor, 
          pressed: iconColor,
          ),
          backgroundColor:
              WidgetStateProperty.all(backgroundColor), // Màu nền của nút
          overlayColor:
              WidgetStateProperty.all(overlayColor), // Màu overlay khi nhấn
          side: WidgetStateProperty.all(ms.button.side.base.primary.style.copyWith(
            color: cs.button.border.base.primary.byMode(isDarkMode),
            width: border_none
          ),

          ),
          // foregroundColor: WidgetStatePropertyAll(iconColor),
          shape: WidgetStateProperty.all(CircleBorder()), // Hình dạng nút
        ),
        icon: icon, // Biểu tượng của nút
      ),
    );
  }
}
