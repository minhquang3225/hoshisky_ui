import 'package:flutter/material.dart';

// ignore: camel_case_types
class HskTitleType1 extends StatelessWidget {
  final Widget title;
  final EdgeInsets padding;
  const HskTitleType1({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.all(0)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: padding,
            child: title,
          );
  }
}