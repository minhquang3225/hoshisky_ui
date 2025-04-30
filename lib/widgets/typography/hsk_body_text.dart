import 'package:flutter/material.dart';

class BodyText1 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  // Constructor để nhận text và style
  const BodyText1({
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyLarge, // Nếu không có style thì dùng headlineLarge từ Theme
    );
  }
}

class BodyText2 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  // Constructor để nhận text và style
  BodyText2({
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodyMedium, // Nếu không có style thì dùng headlineLarge từ Theme
    );
  }
}

class BodyText3 extends StatelessWidget {
  final String text;
  final TextStyle? style;

  // Constructor để nhận text và style
  BodyText3({
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.bodySmall, // Nếu không có style thì dùng headlineLarge từ Theme
    );
  }
}