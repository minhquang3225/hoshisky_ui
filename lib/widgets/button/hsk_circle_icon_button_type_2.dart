import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:provider/provider.dart';

class HskCircleIconButtonType2 extends StatelessWidget {
  late double? buttonWidth;
  late double? marginBottom;
  late double? buttonHeight;
  final Icon icon;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? iconColor;
  late Color? borderColor;
  late double? borderWidth;
  EdgeInsetsGeometry? iconPadding;
  late double? iconSize;
  late Color? overlayColor;



  HskCircleIconButtonType2({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    this.marginBottom,
    required this.icon,
    required this.onPressed,
    this.backgroundColor, 
    this.iconColor,
    this.borderColor, 
    this.borderWidth, 
    this.iconPadding, 
    this.iconSize,
    this.overlayColor,

  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    buttonWidth = buttonWidth ?? ms.iconButtonHorizontalPaddingSmall;
    buttonHeight = buttonHeight ?? ms.iconButtonVerticalPaddingSmall;
    backgroundColor = backgroundColor ?? cs.button.background.base.primary.byMode(isDarkMode);
    iconSize = iconSize ?? ms.fsIconMedium;
    iconColor = iconColor ?? (!isDarkMode ? cs.semantic.primaryColor.light : cs.surfaceTextColor);
    borderColor = borderColor ?? (!isDarkMode?cs.primaryButtonBorderColor:cs.darkModePrimaryButtonBorderColor);
    borderWidth = borderWidth ?? 10;
    iconPadding = iconPadding ?? EdgeInsets.all(0);
    marginBottom = marginBottom ?? 0;
    overlayColor = overlayColor ?? (!isDarkMode?cs.buttonBackgroundPressedColor:cs.darkModeButtonBackgroundPressedColor);

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin: EdgeInsets.only(bottom: marginBottom!),
      child: IconButton(
        onPressed: onPressed,
        color: iconColor,
        iconSize: iconSize, // Kích thước của icon
        padding: iconPadding, // Loại bỏ padding mặc định của IconButton
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor), // Màu nền của nút
          shape: WidgetStateProperty.all(
            CircleBorder(),
          ), // Hình dáng tròn
          overlayColor: WidgetStateProperty.all(overlayColor), // Màu khi nhấn
        ),
        icon: icon,
      ),
    );
  }
}
