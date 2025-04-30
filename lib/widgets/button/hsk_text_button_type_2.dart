import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:hoshisky_ui/utils/get_button_color.dart';
import 'package:provider/provider.dart';

//đặc điểm, nền là phiên bản giảm opacity của primaryColor, không viền 
//Các tham số truyền vào, độ opacity (mặc định 0.1), màu nền mặc định theo hệ thống scheme, màu text mặc định theo hệ thống scheme
class HskTextButtonType2 extends StatelessWidget {
  late double? horizontalPadding;
  late double? verticalPadding;
  late EdgeInsets? margin;
  final VoidCallback? onPressed;
  late Color? backgroundColor;
  late Color? textColor;
  final String buttonTitle;
  late double? backgroundOpacity;



  HskTextButtonType2({
    super.key,
    this.margin,
    this.horizontalPadding,
    this.verticalPadding,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor, 
    this.textColor, 
    this.backgroundOpacity,
   

  });

  @override
  Widget build(BuildContext context) {
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    verticalPadding = verticalPadding ?? ms.textButtonVerticalPaddingSmall;
    horizontalPadding = horizontalPadding ?? ms.textButtonHorizontalPaddingSmall;
    backgroundColor = backgroundColor ?? (!isDarkMode
        ? cs.button.background.baseLight
        : cs.button.background.baseDark);
    textColor = textColor ?? (!isDarkMode ? cs.semantic.primaryColor : cs.semantic.darkModePrimaryColor);
    margin = margin ?? EdgeInsets.all(0);
    backgroundOpacity = backgroundOpacity ?? .05;
     final baseStyle = TextButtonTheme.of(context).style;
    // overlayColor = overlayColor ?? (!isDarkMode?cs.buttonBackgroundPressedColor:cs.darkModeButtonBackgroundPressedColor);
   
    return Container(
      // padding: verticalPadding,
      // height: horizontalPadding,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: baseStyle?.copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.disabled)) {
                // Lấy lại đúng màu disabled từ theme
                return baseStyle.backgroundColor?.resolve(states);
              }
              // Nếu enabled → dùng màu bạn muốn override
              return backgroundColor!.withValues(alpha: backgroundOpacity);
            }),
          foregroundColor: getButtonColor(
            normalColor: textColor!,
            disabledColor: !isDarkMode?cs.button.foreground.baseLight:cs.button.foreground.baseDark,
            hoveredColor: textColor!,
            selectedColor: textColor!,
            pressedColor: textColor!,
          
          ),
          overlayColor: WidgetStatePropertyAll(backgroundColor!.withValues(alpha: .3)),
          alignment: Alignment.center,
          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: verticalPadding!, horizontal: horizontalPadding!))

        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(buttonTitle),
      ),)
    );
  }
}
