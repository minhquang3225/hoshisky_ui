import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/colors/color.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:hoshisky_ui/utils/hsk_button_colors_utils.dart';
import 'package:provider/provider.dart';

class HskCircleIconButtonType2 extends StatelessWidget {
  
  late double? margin;
  late double? paddingSize;
  final Icon icon;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? iconColor;
  late double? iconSize;
  late double? backgroundOpacity;



  HskCircleIconButtonType2({
    super.key,
    this.paddingSize,
    this.margin,
    required this.icon,
    required this.onPressed,
    @Deprecated("Chỉ dùng cho show state của button")
    this.backgroundColor, 
    this.iconColor,
    this.iconSize,
    this.backgroundOpacity,

  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;


    paddingSize = paddingSize ?? ms.button.size.base.primary.vertical;
    iconSize = iconSize ?? ms.fsIconMedium;
    iconColor = iconColor ?? cs.semantic.primaryColor.byMode(isDarkMode);
    backgroundOpacity = backgroundOpacity ?? 0.1;
    backgroundColor = backgroundColor ?? iconColor!.withValues(alpha:backgroundOpacity);
    margin = margin?? 0;
    final overlayColor = iconColor!.withValues(alpha: backgroundOpacity!+.2);
    final baseStyle = IconButtonTheme.of(context).style;
    return Container(

      margin: EdgeInsets.only(bottom: margin!),
      child: IconButton(
        onPressed: onPressed,
        iconSize: iconSize, // Kích thước của icon
        color: iconColor,
        padding: EdgeInsets.all(paddingSize!), // Loại bỏ padding mặc định của IconButton
        style: baseStyle?.copyWith(
          backgroundColor: HskButtonColorUtils.overrideStates(
            base: WidgetStateProperty.all(baseStyle.backgroundColor?.resolve({})??Colors.transparent),
            normal: backgroundColor,
            disabled: baseStyle.backgroundColor?.resolve({WidgetState.disabled}),
          ),
          foregroundColor: HskButtonColorUtils.resolveByState(
            normal: iconColor!,
            disabled: cs.button.foreground.disabled.primary.byMode(isDarkMode),
            hovered: iconColor!,
            selected: iconColor!,
          ),
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
