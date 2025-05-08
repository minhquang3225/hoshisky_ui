import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/extensions/themes/hsk_colors_extension.dart';

class HskFixedTextLabel extends StatelessWidget {
  final String text;
  final TextStyle style;
  final BoxConstraints? constraints;
  final Color? disabledColor;
  final bool isDisabled;

  const HskFixedTextLabel({
    super.key,
    required this.text,
    required this.style,
    this.constraints,
    this.disabledColor,
    this.isDisabled = false,
  });

  /// Dùng để tạo một bản sao có thể override một số giá trị
  HskFixedTextLabel copyWith({
    String? text,
    TextStyle? style,
    BoxConstraints? constraints,
    Color? disabledColor,
    bool? isDisabled,
  }) {
    return HskFixedTextLabel(
      text: text ?? this.text,
      style: style ?? this.style,
      constraints: constraints ?? this.constraints,
      disabledColor: disabledColor ?? this.disabledColor,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = context.colorScheme;
    final ms = context.measure;
    final isDarkMode = context.isDarkMode;
   

    final resolvedDisabledColor = disabledColor ??
        cs.button.foreground.disabled.primary.byMode(isDarkMode);
    final resolvedConstraints = constraints ??
        BoxConstraints(
          maxHeight: ms.button.size.base.medium.labelHeight,
        );

    final resolvedStyle =
        isDisabled ? style.copyWith(color: resolvedDisabledColor) : style;
 print('\x1B[33m text ⚠️ maxHeiht constraint: ${resolvedConstraints.maxHeight} \x1B[0m');
    return ConstrainedBox(
      constraints: resolvedConstraints,
      child: Center(
        child: AutoSizeText(
          text,
          maxLines: 1,
          minFontSize: 8,
          stepGranularity: 0.5,
          style: resolvedStyle,
        ),
      ),
    );
  }
}

class HskFixedIconLabel extends StatelessWidget {
  final Icon icon;
  // final TextStyle style;
  final BoxConstraints? constraints;
  final Color? disabledColor;
  final bool isDisabled;
  const HskFixedIconLabel({
    super.key,
    required this.icon,
    // this.style,
    this.constraints,
    this.disabledColor,
    this.isDisabled = false,
  });

  /// Dùng để tạo một bản sao có thể override một số giá trị
  HskFixedIconLabel copyWith({
    Icon? icon,
    // TextStyle? style,
    BoxConstraints? constraints,
    Color? disabledColor,
    bool? isDisabled,
  }) {
    return HskFixedIconLabel(
      icon: icon ?? this.icon,
      // style: style ?? this.style,
      constraints: constraints ?? this.constraints,
      disabledColor: disabledColor ?? this.disabledColor,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  @override
Widget build(BuildContext context) {
  final ms = context.measure;
  final cs = context.colorScheme;
  final isDarkMode = context.isDarkMode;
  


  final resolvedDisabledColor =
      disabledColor ?? cs.button.foreground.disabled.primary.byMode(isDarkMode);
  final resolvedConstraints = constraints ??
      BoxConstraints(
        maxHeight: ms.button.size.base.medium.labelHeight,
        
      );
  final resolvedIconColor = isDisabled
      ? resolvedDisabledColor
      : (icon.color ?? cs.button.foreground.base.primary.byMode(isDarkMode));
  return ConstrainedBox(
    constraints: resolvedConstraints,
    child: FittedBox(
      child: Icon(
        icon.icon,
        size: icon.size,
        color: resolvedIconColor,
      ),
    ),
  );
}

}
