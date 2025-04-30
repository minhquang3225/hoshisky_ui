import 'package:flutter/material.dart';

class HskBorderlessTableType1 extends StatelessWidget {
  final List<Widget>? topHeaders; // Tiêu đề ngang (optional)
  final List<Widget>? leftHeaders; // Tiêu đề dọc (optional)
  final List<List<Widget>> data; // Nội dung bảng
  final int columnCount; // Số cột
  final int rowCount; // Số hàng
  final TableCellVerticalAlignment verticalAlignment;
  final Alignment contentAlignment; // Căn chỉnh nội dung
  final double gapColumn;
  final double gapRow;
  final double minTopHeaderCellHeight;

  const HskBorderlessTableType1({
    super.key,
    this.topHeaders,
    this.leftHeaders,
    required this.data,
    required this.columnCount,
    required this.rowCount,
    this.verticalAlignment = TableCellVerticalAlignment.middle,
    this.contentAlignment = Alignment.center,
    this.gapColumn = 10,
    this.gapRow = 10,
    this.minTopHeaderCellHeight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide.none,
        outside: BorderSide.none,
      ),
      children: [
        // Tiêu đề ngang (nếu có)
        if (topHeaders != null)
          TableRow(
            children: [
              if (leftHeaders != null)
                TableCell(child: SizedBox.shrink()), // ô trống góc trên trái
              ...List.generate(columnCount, (index) {
                return TableCell(
                  verticalAlignment: verticalAlignment,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: minTopHeaderCellHeight,
                    ),
                    child: Align(
                      alignment: contentAlignment,
                      child: index < topHeaders!.length
                          ? topHeaders![index]
                          : SizedBox.shrink(), // tránh lỗi thiếu tiêu đề
                    ),
                  ),
                );
              }),
            ],
          ),

        // Các dòng dữ liệu
        for (var i = 0; i < rowCount; i++)
          TableRow(
            children: [
              if (leftHeaders != null)
                TableCell(
                  verticalAlignment: verticalAlignment,
                  child: Align(
                    alignment: contentAlignment,
                    child: i < leftHeaders!.length
                        ? leftHeaders![i]
                        : SizedBox.shrink(), // tránh lỗi nếu thiếu dòng tiêu đề dọc
                  ),
                ),
              ...List.generate(columnCount, (index) {
                return TableCell(
                  verticalAlignment: verticalAlignment,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: gapColumn,
                      vertical: gapRow,
                    ),
                    child: Align(
                      alignment: contentAlignment,
                      child: i < data.length && index < data[i].length
                          ? data[i][index]
                          : SizedBox.shrink(), // tránh lỗi nếu thiếu ô dữ liệu
                    ),
                  ),
                );
              }),
            ],
          ),
      ],
    );
  }
}
