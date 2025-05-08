import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  final Paint linePaint; // Đổi tên biến paint thành linePaint

  DottedLinePainter()
      : linePaint = Paint()
          ..color = Colors.green
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5.0; // Độ dài của một đoạn chấm
    double dashSpace = 5.0; // Khoảng cách giữa các đoạn chấm
    double startX = 0.0;

    // Vẽ một đường chấm từ trái sang phải
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), linePaint); // Sử dụng linePaint thay vì paint
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;  // Không cần vẽ lại
  }
}

class HskDottedLine extends StatelessWidget {
  const HskDottedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, 4), // Tăng chiều cao để đường kẻ dễ nhìn
      painter: DottedLinePainter(),
    );
  }
}
