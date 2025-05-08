import 'package:flutter/material.dart';

// ignore: camel_case_types
class HskTitleWithUnderlineType1 extends StatelessWidget {
  final Widget line;
  final Widget title;
  final EdgeInsets padding;
  const HskTitleWithUnderlineType1({
    super.key,
    required this.line,
    required this.title,
    this.padding = const EdgeInsets.all(0)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                line
              ],
            ),
          );
  }
}