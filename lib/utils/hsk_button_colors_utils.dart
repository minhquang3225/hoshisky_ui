import 'package:flutter/material.dart';

class HskButtonColorUtils {
  /// Tạo [WidgetStateProperty] từ các màu cụ thể theo trạng thái.
  static WidgetStateProperty<Color> resolveByState({
    required Color normal,
    required Color disabled,
    required Color hovered,
    required Color selected,
  }) {
    return WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.disabled)) return disabled;
      if (states.contains(WidgetState.hovered)) return hovered;
      if (states.contains(WidgetState.selected)) return selected;
      return normal;
    });
  }

  /// Ghi đè một vài trạng thái nhất định từ [base], với API đơn giản hơn.
  static WidgetStateProperty<Color> overrideStates({
    required WidgetStateProperty<Color> base,
    Color? normal,
    Color? disabled,
    Color? hovered,
    Color? selected,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled) && disabled != null) return disabled;
      if (states.contains(WidgetState.hovered) && hovered != null) return hovered;
      if (states.contains(WidgetState.selected) && selected != null) return selected;

      if (states.isEmpty && normal != null) return normal;

      return base.resolve(states)!;
    });
  }
}
