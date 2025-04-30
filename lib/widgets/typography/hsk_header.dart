import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;  // Tham số color nếu người dùng truyền vào.
  final EdgeInsetsGeometry? margin;  // Thêm tham số margin
  final FontStyle? fontStyle; // Thêm tham số fontStyle

  // Constructor nhận vào text, style, color, margin và fontStyle
  const Header1({
    required this.text,
    this.style,
    this.color,
    this.margin,
    this.fontStyle,  // Khai báo fontStyle
  });

  @override
  Widget build(BuildContext context) {
    // Lấy style từ Theme và áp dụng nếu có color và fontStyle truyền vào
    TextStyle textStyle = style ?? Theme.of(context).textTheme.headlineLarge!;

    // Nếu color được truyền vào, thay đổi màu của textStyle
    textStyle = textStyle.copyWith(
      color: color ?? textStyle.color, // Nếu không có color, giữ nguyên màu gốc.
      fontStyle: fontStyle ?? textStyle.fontStyle, // Thêm fontStyle nếu có
    );

    return Container(
      margin: margin ?? EdgeInsets.all(0),  // Áp dụng margin nếu có, mặc định là 0
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class Header2 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;  // Tham số color nếu người dùng truyền vào.
  final EdgeInsetsGeometry? margin;  // Thêm tham số margin
  final FontStyle? fontStyle; // Thêm tham số fontStyle

  // Constructor nhận vào text, style, color, margin và fontStyle
  const Header2({
    super.key, 
    required this.text,
    this.style,
    this.color,
    this.margin,
    this.fontStyle,  // Khai báo fontStyle
  });

  @override
  Widget build(BuildContext context) {
    // Lấy style từ Theme và áp dụng nếu có color và fontStyle truyền vào
    TextStyle textStyle = style ?? Theme.of(context).textTheme.headlineMedium!;

    // Nếu color được truyền vào, thay đổi màu của textStyle
    textStyle = textStyle.copyWith(
      color: color ?? textStyle.color, // Nếu không có color, giữ nguyên màu gốc.
      fontStyle: fontStyle ?? textStyle.fontStyle, // Thêm fontStyle nếu có
    );

    return Container(
      margin: margin ?? EdgeInsets.all(0),  // Áp dụng margin nếu có, mặc định là 0
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class Header3 extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;  // Tham số color nếu người dùng truyền vào.
  final EdgeInsets? margin;  // Thêm tham số margin
  final FontStyle? fontStyle; // Thêm tham số fontStyle

  // Constructor nhận vào text, style, color, margin và fontStyle
  const Header3({
    super.key, 
    required this.text,
    this.style,
    this.color,
    this.margin,
    this.fontStyle,  // Khai báo fontStyle
  });

  @override
  Widget build(BuildContext context) {
    // Lấy style từ Theme và áp dụng nếu có color và fontStyle truyền vào
    TextStyle textStyle = style ?? Theme.of(context).textTheme.headlineSmall!;

    // Nếu color được truyền vào, thay đổi màu của textStyle
    textStyle = textStyle.copyWith(
      color: color ?? textStyle.color, // Nếu không có color, giữ nguyên màu gốc.
      fontStyle: fontStyle ?? textStyle.fontStyle, // Thêm fontStyle nếu có
    );

    return Container(
      margin: margin ?? EdgeInsets.all(0),  // Áp dụng margin nếu có, mặc định là 0
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
