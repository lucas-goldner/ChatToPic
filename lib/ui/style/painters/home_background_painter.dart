import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/style/painters/common_painters.dart';
import 'package:flutter/material.dart';

class HomeBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final commonpainters = Commonpainters();
    final paint = Paint()
      ..color = ChatToPicColors.homeBackgroundColor
      ..strokeWidth = 2;

    commonpainters.drawRect(
      const Offset(0, 0),
      Offset(size.width, size.height),
      CanvasArgs(canvas, size, paint),
    );

    _drawBackgroundLines(canvas, size);
  }

  _drawBackgroundLines(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = ChatToPicColors.homeBackgroundLineColor
      ..strokeWidth = 2;

    for (int i = 0; i <= size.height; i += 10) {
      canvas.drawLine(
        Offset(0, i.toDouble()),
        Offset(size.width, i.toDouble()),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
