import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
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
  double? iconButtonElevation ;
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
    this.iconButtonElevation ,
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

    buttonWidth = buttonWidth ?? ms.iconButtonHorizontalPaddingSmall;
    marginBottom = marginBottom?? 0;
    buttonHeight = buttonHeight ?? ms.iconButtonVerticalPaddingSmall;
    backgroundColor = backgroundColor ??
        (!isDarkMode
            ? cs.button.background.baseLight
            : cs.button.background.baseDark);
    iconButtonElevation = iconButtonElevation  ?? ms.iconButtonElevation;
    iconColor =
        iconColor ?? (!isDarkMode ? cs.tertiaryIconColor : cs.darkModeTertiaryIconColor);
    iconSize = iconSize ?? ms.fsIconMedium;
    borderColor = borderColor ??
        (!isDarkMode
            ? gray400
            : gray700);
    borderWidth = borderWidth ?? 1;
    iconPadding = iconPadding ?? EdgeInsets.all(0);
    marginBottom = marginBottom ?? 0;
    overlayColor = overlayColor ?? (!isDarkMode
        ? cs.button.background.pressedLight
        : cs.button.background.pressedDark);
    return Container(
  width: buttonWidth,
  height: buttonHeight,
  margin: EdgeInsets.only(bottom: marginBottom!),
  child: Material(
    elevation: iconButtonElevation! ,  // Độ nổi của IconButton
    color: backgroundColor, // Màu nền của IconButton
    shape: CircleBorder(
      side: BorderSide(
        width: borderWidth!,  // Độ dày viền
        color: borderColor!,  // Màu viền
        style: borderWidth == 0 ? BorderStyle.none : BorderStyle.solid,
      ),
    ),
    child: IconButton(
      onPressed: onPressed,
      color: iconColor,  // Màu của icon
      iconSize: iconSize, // Kích thước của icon
      padding: iconPadding, // Loại bỏ padding mặc định của IconButton
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent), // Màu nền của nút
        overlayColor: WidgetStateProperty.all(overlayColor), // Màu overlay khi nhấn
        shape: WidgetStateProperty.all(CircleBorder()), // Hình dạng nút
      ),
      icon: icon,  // Biểu tượng của nút
    ),
  ),
);
  }
}
