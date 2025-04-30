import 'package:flutter/material.dart';

WidgetStateProperty<Color> getButtonColor({
  required Color normalColor,
  required Color disabledColor,
  required Color pressedColor,
  required Color hoveredColor,
  required Color selectedColor,
}) {
  return WidgetStateProperty.resolveWith<Color>((states) {
    if (states.contains(WidgetState.disabled)) return disabledColor;
    if (states.contains(WidgetState.pressed)) return pressedColor;
    if (states.contains(WidgetState.hovered)) return hoveredColor;
    if (states.contains(WidgetState.selected)) return selectedColor;
    return normalColor;
  });
}
