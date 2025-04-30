import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/size/width.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_dark_mode_provider.dart';
import 'package:hoshisky_ui/providers/hsk_input_provider.dart';



import 'package:hoshisky_ui/widgets/button/hsk_circle_icon_button_type_1.dart';
import 'package:provider/provider.dart';

class HskTextInputWithActionButtonType3 extends StatefulWidget {
  final EdgeInsetsGeometry? marginBottom;
  final EdgeInsetsGeometry? contentInputPadding;
  final String hintText;
  final String labelText;
  final Icon icon; 
  final double? buttonWidth;
  final double? inputHeight;
  final double? inputBorderWidth;
  final double? buttonBorderWidth;
  final BoxDecoration boxDecoration;
  final VoidCallback callback;

  const HskTextInputWithActionButtonType3(
      {
      super.key,
      //default config
      this.marginBottom,
      this.buttonWidth,
      this.inputHeight,
      this.contentInputPadding,
      this.inputBorderWidth,
      this.buttonBorderWidth,
      //content 
      this.hintText = '',
      this.boxDecoration = const BoxDecoration(),

      required this.labelText,
      required this.icon, // actionButton là bắt buộc
      required this.callback
      
      });

  @override
  _HskTextInputWithActionButtonType3State createState() =>
      _HskTextInputWithActionButtonType3State();
}

class _HskTextInputWithActionButtonType3State
    extends State<HskTextInputWithActionButtonType3> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    //biến triển khai
    final ms = context.measure;
    final cs = context.colorScheme;
    final isDarkMode = context.isDarkMode;

    //biến mặc định

    EdgeInsetsGeometry spacingBottomInput = widget.marginBottom ?? ms.spacingBottomInputSmall;
    double inputHeight = widget.inputHeight ?? ms.inputHeightSmall;
    double buttonWidth = widget.buttonWidth ?? ms.inputButtonWidthSmall;
    double inputBorderWidth = widget.inputBorderWidth ?? ms.inputBorderWidth;
    double buttonHeight = inputHeight - 2 * inputBorderWidth;
    EdgeInsetsGeometry contentInputPadding = widget.contentInputPadding ?? EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 100);
    Color buttonTextColor = !isDarkMode? cs.surfaceTextColor : cs.surfaceTextColor;
    Color buttonBackgroundColor = !isDarkMode? cs.button.background.base.primary.light : cs.button.background.base.primary.dark;
    //lấy key controller cho input
    String key = HskInputProvider().getKey(); // Không đặt trong Consumer để tránh rebuild

    return Column(
      children: [
        Padding(
          padding: spacingBottomInput,
          child: Consumer<HskInputProvider>(
            builder: (context, provider, child) {
              return Stack(
                children: [
                  SizedBox(
                    height: inputHeight,
                    child: TextField(
                      controller: provider.controllers[key],
                      focusNode: _focusNode,
                      onChanged: (value) =>
                          {provider.updateController(key, value)},
                      decoration: InputDecoration(
                        labelText: widget.labelText,
                        hintText: widget.hintText,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: contentInputPadding,

                        // enabledBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  Positioned(
                    right: inputBorderWidth,
                    top: inputBorderWidth,
                    child: HskCircleIconButtonType1(
                      // buttonWidth: buttonWidth,
                      // buttonHeight: buttonHeight,
                      backgroundColor: buttonBackgroundColor,
                      iconColor: buttonTextColor,
                      icon: widget.icon, 
                      onPressed: widget.callback)
                  ),
                  
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
