import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:provider/provider.dart';

class HskDivider extends StatelessWidget {
  const HskDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final ms = context.measure;
    return Container(
      height: 2,
      decoration: BoxDecoration(
    color: Colors.black,  // Màu của Divider
    borderRadius: BorderRadius.circular(8),  // Bo tròn các góc với bán kính 8px
  ),
    );
  }
}
