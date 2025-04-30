import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:provider/provider.dart';

class HskContentCard extends StatelessWidget {
  final Widget content; // Widget content
  final BoxConstraints? constraint;
  final Color? backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry cardPadding;
  late EdgeInsets? cardMargin;

  HskContentCard({
    super.key,
    required this.content,
    required this.backgroundColor,
    this.constraint,
    this.elevation = 2,
    required this.cardPadding ,
    this.cardMargin,
  });

  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;
    cardMargin = cardMargin ?? ms.spacingBottomComponentLarge;
    return Container(
      constraints: constraint,
      margin: cardMargin,
      child: Card(
          elevation: elevation,
          shadowColor: isDarkMode
              ? cs.darkModeShadowColor
              : cs.shadowColor,
          color: backgroundColor,
          borderOnForeground: false,
          // clipBehavior: Clip.none,     //xử lí khi tràn ra ngoài card
          child: Padding(
            padding: cardPadding,
            child: content,
          )),
    );
  }
}
