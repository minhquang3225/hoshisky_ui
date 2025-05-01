import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';
import 'package:provider/provider.dart';

//Icon button có đặc điểm, tròn, màu sác nền và màu chữ quy định bởi IconButtonThemeData

class HskCircleIconButtonType1 extends StatelessWidget {
  late double? paddingSize;
  late EdgeInsets? margin;
  final Icon icon;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? iconColor;
  late Color? borderColor;
  late double? iconSize;
  // late Color? overlayColor;

  HskCircleIconButtonType1({
    super.key,
    this.margin,
    this.paddingSize,
    required this.icon,
    required this.onPressed,
    this.backgroundColor, // Mặc định là màu xanh
    this.iconColor, // Mặc định là màu trắng
    this.iconSize,
    this.borderColor, // Mặc định là không có viền
    // this.overlayColor,

  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    paddingSize = paddingSize ?? ms.button.size.base.primary.vertical;

    backgroundColor = backgroundColor ?? cs.semantic.primaryColor.byMode(isDarkMode);
    iconColor = iconColor ?? white;
    iconSize = iconSize ?? ms.button.font.base.primary.style.fontSize;
    borderColor = borderColor ?? (!isDarkMode?cs.primaryButtonBorderColor:cs.darkModePrimaryButtonBorderColor);
    margin = margin ?? EdgeInsets.all(0);
    
    final baseStyle = IconButtonTheme.of(context).style;
    // overlayColor = overlayColor ?? (!isDarkMode?cs.buttonBackgroundPressedColor:cs.darkModeButtonBackgroundPressedColor);
   
    return Container(
      margin: margin,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(horizontal: paddingSize!, vertical: paddingSize!), // Loại bỏ padding mặc định của IconButton
        style: baseStyle?.copyWith(
          backgroundColor: HskButtonColorUtils.overrideStates(
            base: WidgetStateProperty.all(baseStyle.backgroundColor?.resolve({})??Colors.transparent),
            normal: backgroundColor,
            disabled: baseStyle.backgroundColor?.resolve({WidgetState.disabled})
          ),
          foregroundColor: WidgetStateProperty.all(iconColor), // Màu của icon
          shape: WidgetStatePropertyAll(CircleBorder()),
        ),
        icon: icon,
      ),
    );
  }
}
