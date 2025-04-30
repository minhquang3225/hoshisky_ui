import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/size/width.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';


import 'package:provider/provider.dart';

class ShapeBulletRight extends StatelessWidget{
  final Color bulletBackgroundColor;
  final Color backgroundColor;
  final double bulletHeight;
  final double bulletWidth;
  const ShapeBulletRight({
    super.key, 
    required this.bulletBackgroundColor,
    required this.backgroundColor,
    required this.bulletHeight,
    required this.bulletWidth,
  });

  @override
  Widget build(BuildContext context) {
     final ms = context.measure;
     final cs = context.colorScheme;
     final isDarkMode = Provider.of<HskDarkModeProvider>(context).isDarkMode;
    return SizedBox(
      width: w_20,
      height: ms.inputHeightSmall- 2* ms.inputBorderWidth,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(          //bullet
              width: w_5,
              height: ms.inputHeightSmall - 2*ms.inputBorderWidth,
              decoration: BoxDecoration(
                color: !isDarkMode?cs.primaryColor:cs.darkModePrimaryColor,
              ),
            ),
          ),
          Positioned(           //background
            top: 0,
            right: 0,
            child: AnimatedContainer(
               duration: Duration(milliseconds: 210), // Thời gian cho chuyển động
          curve: Curves.easeIn,  // Kiểu chuyển động
              height: ms.inputHeightSmall - 2*ms.inputBorderWidth,
              width: w_10,
              decoration: BoxDecoration(
                color: !isDarkMode?cs.inputBackgroundColor:cs.darkModeInputBackgroundColor,
                borderRadius: ms.borderRadius,
                
              )
            )
          ),
        ],
      ),
    );
  }
}