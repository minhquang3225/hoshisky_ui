import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HskButtonTextLabel extends StatelessWidget {
  final TextStyle style;
  final String label;
  final double minHeight;
  final double minWidth;

  const HskButtonTextLabel({
    super.key,
    required this.style,
    required this.label,
    this.minHeight = 24,
    this.minWidth = 48,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight,
        minWidth: minWidth,
      ),
      child: Center(
        child: AutoSizeText(
          label,
          maxLines: 1,
          minFontSize: 8,
          stepGranularity: 0.5,
          style: style,
        ),
      ),
    );
  }
}
