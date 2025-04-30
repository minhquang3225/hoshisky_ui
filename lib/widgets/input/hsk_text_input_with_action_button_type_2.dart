import 'package:flutter/material.dart';
import 'package:hoshisky_ui/constants/size/width.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_input_provider.dart';



import 'package:hoshisky_ui/widgets/shape/shape_bullet_right.dart';
import 'package:provider/provider.dart';

class HskTextInputWithActionButtonType2 extends StatefulWidget {
  final EdgeInsetsGeometry marginBottom;
  final String hintText;
  final String labelText;
  final double buttonWidth;
  final double inputHeight;
  final BoxDecoration boxDecoration;
  final Color backgroundInputColor;
  final Widget icon;
  final VoidCallback callback;

  const HskTextInputWithActionButtonType2(
      {super.key,
      this.marginBottom = const EdgeInsets.all(0),
      this.hintText = '',
      this.buttonWidth = w_20,
      this.inputHeight = w_20,
      this.boxDecoration = const BoxDecoration(),
      required this.labelText,
      required this.icon, // icon là bắt buộc
      required this.backgroundInputColor
      , required this.callback
      
      });

  @override
  _HskTextInputWithActionButtonType2State createState() =>
      _HskTextInputWithActionButtonType2State();
}

class _HskTextInputWithActionButtonType2State
    extends State<HskTextInputWithActionButtonType2> {
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
    final ms = context.measure;
    final cs = context.colorScheme;



    String key =
        HskInputProvider().getKey(); // Không đặt trong Consumer để tránh rebuild

    return Column(
      children: [
        Padding(
          padding: widget.marginBottom,
          child: Consumer<HskInputProvider>(
            builder: (context, provider, child) {
              return Stack(
                children: [
                  SizedBox(
                    height: widget.inputHeight,
                    child: TextField(                        //phần text field
                      controller: provider.controllers[key],
                      focusNode: _focusNode,
                      onChanged: (value) =>
                          {provider.updateController(key, value)},
                      decoration: InputDecoration(
                        labelText: widget.labelText,
                        hintText: " ${widget.hintText}",
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 100),

                        // enabledBorder: InputBorder.none,
                        // focusedBorder: InputBorder.none,
                        // border: InputBorder.none,
                      ),
                    ),
                  ),
                  Positioned(
                    right: ms.inputBorderWidth,
                    top: ms.inputBorderWidth,
                    child: SizedBox(
                        width: ms.inputButtonWidthSmall, // Chiều rộng của button
                        height: ms.inputHeightSmall - 2 * ms.inputBorderWidth,
                        child: widget.icon),
                  ),
                  Positioned(
                    right: ms.inputButtonWidthSmall,
                    top: ms.inputBorderWidth,
                    child: ShapeBulletRight(
                      bulletBackgroundColor: widget.backgroundInputColor, 
                      backgroundColor: cs.darkModePrimaryColor, 
                      bulletHeight: widget.inputHeight-2 * ms.dividerSpace, 
                      bulletWidth: w_15,
                    )
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
