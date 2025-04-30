import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/spacing/padding.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';


import 'package:hoshisky_ui/widgets/card/hsk_content_card.dart';
import 'package:provider/provider.dart';

class HskCardSectionType1 extends StatelessWidget {
  final Widget title; // Widget title
  final Widget content; // Widget content
  final BoxConstraints? constraint;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double elevation;
  final EdgeInsetsGeometry cardPadding;
  final CrossAxisAlignment textAlign;
  const HskCardSectionType1({
    super.key,
    required this.title,
    required this.content,
    required this.backgroundColor,
    this.constraint,
    this.elevation = 2,
    this.margin,
    this.cardPadding = const EdgeInsets.all(0),
    this.textAlign = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    return Column(
        crossAxisAlignment: textAlign,
        children: [
          title,
          HskContentCard(
            content: content, 
            backgroundColor: backgroundColor,
            cardPadding: cardPadding,
            elevation: elevation,
            constraint: constraint,
            
          ),
        ],
    );
  }
}
