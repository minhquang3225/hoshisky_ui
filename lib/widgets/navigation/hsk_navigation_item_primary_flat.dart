import 'package:flutter/material.dart';

class HskPrimaryNavigationItem extends StatelessWidget {
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;
  final double selectedColorOpacity;
  final Widget icon;
  final Widget title;
  final ShapeBorder shape;
  final EdgeInsets padding;
  final VoidCallback? onTap;

  const HskPrimaryNavigationItem({
    super.key,
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
    this.selectedColorOpacity = 0.1,
    required this.icon,
    required this.title,
    this.shape = const StadiumBorder(),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorTween = Color.lerp(
      selectedColor.withAlpha(0),
      selectedColor.withAlpha((selectedColorOpacity * 255).round()),
      selected ? 1.0 : 0.0,
    );

    final iconColor = Color.lerp(unselectedColor, selectedColor, selected ? 1.0 : 0.0);

    return Material(
      color: Colors.transparent,
      shape: shape,
      child: InkWell(
        onTap: onTap,
        customBorder: shape,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: ShapeDecoration(
            color: colorTween,
            shape: shape,
          ),
          child: Padding(
            padding: padding,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: IconTheme(
                      key: ValueKey(selected),
                      data: IconThemeData(
                        color: iconColor,
                        size: 24,
                      ),
                      child: icon,
                    ),
                  ),
                  // Khoảng cách giữa icon và title
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: SizedBox(
                      width: selected ? 8 : 0,
                    ),
                  ),
                  // Sử dụng Visibility để kiểm soát việc render và không gian
                  Visibility(
                    visible: selected, // Chỉ hiển thị khi selected là true
                    // Nếu muốn animation khi hiển thị/ẩn, có thể dùng AnimatedCrossFade
                    // hoặc kết hợp với AnimatedOpacity/AnimatedSize cho phần tử con nếu cần.
                    // Tuy nhiên, với maintainSize: false, widget sẽ bị thêm/bớt khỏi cây.
                    maintainSize: false,      // KHÔNG giữ không gian
                    maintainAnimation: false, // KHÔNG duy trì animation
                    maintainState: false,     // KHÔNG duy trì trạng thái
                    child: Flexible( // Vẫn nên dùng Flexible để title tự điều chỉnh kích thước khi hiển thị
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: selectedColor, // Khi hiển thị, luôn dùng selectedColor
                          fontWeight: FontWeight.w600,
                        ),
                        child: title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}