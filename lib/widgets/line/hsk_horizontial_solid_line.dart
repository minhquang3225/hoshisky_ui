import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/spacing/margin.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';


import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HskHorizontialSolidLine extends StatelessWidget {
  final double? dividerSpacingBottom;
  final Color? dividerColor;
  final BorderRadius? dividerBorderRadius;
  final double? dividerThickness;
  final double? dividerWidth;
  final double? dividerIndent;
  final double? dividerEndIndent;
  const HskHorizontialSolidLine({
    super.key, 
    this.dividerColor,
    this.dividerBorderRadius,
    this.dividerThickness,
    this.dividerWidth,
    this.dividerSpacingBottom,
    this.dividerIndent = 0.0, // Giá trị mặc định cho indent
    this.dividerEndIndent = 0.0, // Giá trị mặc định cho endIndent
  });
  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    //giá trị mặc định của biến
    double dividerSpacingBottom = this.dividerSpacingBottom ?? m_10;
    double dividerWidth = this.dividerWidth ?? double.infinity;
    Color dividerColor = this.dividerColor ?? (isDarkMode ? cs.darkModeDividerColor : cs.dividerColor);
    BorderRadius? dividerBorderRadius = this.dividerBorderRadius ?? ms.dividerRounded;
    double dividerThickness = this.dividerThickness ?? ms.dividerThickness;
    double dividerIndent = this.dividerIndent ?? ms.indent;
    double dividerEndIndent = this.dividerEndIndent ?? ms.endIndent;

    return Container(
      margin: EdgeInsets.only(left:  dividerIndent, right: dividerEndIndent, bottom: dividerSpacingBottom), // Áp dụng indent và endIndent
      decoration: BoxDecoration(
        borderRadius: dividerBorderRadius, // Bo góc của đường kẻ
        border: Border.all(
          color: dividerColor, // Màu của đường kẻ
          width: dividerThickness/2,           // Độ dày của đường kẻ
        ),
      ),
      width: dividerWidth, // Chiều rộng của đường kẻ chiếm toàn bộ không gian ngang
      height: 0.001,             // Chiều cao (độ dày) của đường kẻ
      
    );
  }
}


