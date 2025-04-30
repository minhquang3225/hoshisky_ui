import 'package:flutter/material.dart';
import 'package:hoshisky_ui/extensions/theme_provider_extension.dart';
import 'package:hoshisky_ui/providers/hsk_input_provider.dart';



import 'package:provider/provider.dart';

class HskTextInputType1 extends StatefulWidget {
  final EdgeInsetsGeometry marginBottom;
  final String hintText;
  final String labelText;

  const HskTextInputType1({
    super.key,
    this.marginBottom = const EdgeInsets.all(0),
    this.hintText = '',
    required this.labelText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HskTextInputType1State createState() => _HskTextInputType1State();
}

class _HskTextInputType1State extends State<HskTextInputType1> {
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
    String key = HskInputProvider().getKey();  //không được nằm trong Consumer vì hàm này gây rebuild

    return SizedBox(
      height: ms.inputHeightSmall,
        child: Padding(
          padding: widget.marginBottom,
          child: Consumer<HskInputProvider>(builder: (context, provider, child) {
            return TextField(
              controller: provider.controllers[key],
              focusNode: _focusNode, // Assign the FocusNode
              onChanged: (value) => {provider.updateController(key, value)},
              decoration: InputDecoration(
                labelText: widget.labelText,
                hintText: " ${widget.hintText}",
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            );
          }),
        ),
    
    );
  }
}
