import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/size/height.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';

import 'package:hoshisky_ui/widgets/card/hsk_content_card.dart';
import 'package:provider/provider.dart';

class HskListCardSectionType1 extends StatelessWidget {
  final Widget title; // Widget title
  final List<Widget> contentList; // List of widgets content
  final CrossAxisAlignment textAlign;
  final BoxConstraints cardMinHeight;
  final EdgeInsetsGeometry? nextSectionSpacing;

  const HskListCardSectionType1({
    super.key,
    required this.title,
    required this.contentList, // contentList thay cho content
    this.nextSectionSpacing,
    this.textAlign = CrossAxisAlignment.start,
    this.cardMinHeight = const BoxConstraints(minHeight: h_20),
  });

  @override
  Widget build(BuildContext context) {
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.read<HskDarkModeProvider>().isDarkMode;
    final nextSectionSpacing =
        this.nextSectionSpacing ?? ms.spacingBottomComponentLarge;
    return Container(
      margin: nextSectionSpacing,

      child: Column(
        crossAxisAlignment: textAlign,
        children: [
          Padding(
            padding: ms.spacingBottomComponentLarge,
            child: title,
          ),
          // Dùng ListView hoặc Column để hiển thị danh sách các content
          ...contentList.map((content) {
            return HskContentCard(
              content: content,
              backgroundColor:
                  !isDarkMode ? cs.surfaceColor : cs.darkModeSurfaceColor,
              cardPadding: ms.boxPaddingLarge,
              elevation: ms.cardElevation,
              constraint: cardMinHeight,
            );
          }),
        ],
      ),
    );
  }
}
