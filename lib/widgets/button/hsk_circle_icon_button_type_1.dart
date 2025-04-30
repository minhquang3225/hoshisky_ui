import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:provider/provider.dart';

//Icon button có đặc điểm, tròn, màu sác nền và màu chữ quy định bởi IconButtonThemeData

class HskCircleIconButtonType1 extends StatelessWidget {
  late double? horizontalPadding;
  late double? verticalPadding;
  late double? marginBottom;
  final Icon icon;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? iconColor;
  late Color? borderColor;
  late double? borderWidth;
  EdgeInsetsGeometry? iconPadding;
  late double? iconSize;
  late Color? overlayColor;

  HskCircleIconButtonType1({
    super.key,
    this.horizontalPadding,
    this.marginBottom,
    this.verticalPadding,
    required this.icon,
    required this.onPressed,
    this.backgroundColor, // Mặc định là màu xanh
    this.iconColor, // Mặc định là màu trắng
    this.borderColor, // Mặc định là không có viền
    this.borderWidth, // Mặc định là không có viền
    this.iconPadding, // Mặc định là không có padding
    this.iconSize, // Mặc định là kích thước icon trung bình
    this.overlayColor,

  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    horizontalPadding = horizontalPadding ?? ms.iconButtonHorizontalPaddingSmall;
    verticalPadding = verticalPadding ?? ms.iconButtonVerticalPaddingSmall;
    backgroundColor = backgroundColor ?? (!isDarkMode
        ? cs.button.background.base.primary.light
        : cs.button.background.base.primary.dark);
    iconColor = iconColor ?? (!isDarkMode ? cs.surfaceTextColor : cs.surfaceTextColor);
    borderColor = borderColor ?? (!isDarkMode?cs.primaryButtonBorderColor:cs.darkModePrimaryButtonBorderColor);
    borderWidth = borderWidth ?? 0;
    iconPadding = iconPadding ?? EdgeInsets.all(0);
    iconSize = iconSize ?? ms.fsIconMedium;
    marginBottom = marginBottom ?? 0;
    overlayColor = overlayColor ?? (!isDarkMode?cs.buttonBackgroundPressedColor:cs.darkModeButtonBackgroundPressedColor);
   
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom!),
      child: IconButton(
        onPressed: onPressed,
        iconSize: iconSize, // Kích thước của icon
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding!, vertical: verticalPadding!), // Loại bỏ padding mặc định của IconButton
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor, // Màu nền của nút
          foregroundColor: iconColor, // Màu của icon
          shape:CircleBorder(), // Hình dáng tròn
          highlightColor:overlayColor, // Màu sắc khi nhấn núWidget
        ),
        icon: icon,
      ),
    );
  }
}
