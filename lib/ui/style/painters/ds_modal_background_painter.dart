import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

class DSModalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ChatToPicColors.dsGreyBackground
      ..strokeWidth = 1;
    CanvasArgs canvasArgs = CanvasArgs(canvas, size, paint);

    // Painting the background three times
    // since the background was mixing with the layer behind.
    _paintBackground(canvasArgs);
    _paintBackground(canvasArgs);
    _paintBackground(canvasArgs);
  }

  void _paintBackground(CanvasArgs canvasArgs) {
    int two = 2;
    for (double index = 0; index <= canvasArgs.size.height; index++) {
      final postion1 = Offset(0, index);
      final postion2 = Offset(canvasArgs.size.width, index);
      canvasArgs.paint.color = index % two == 0
          ? ChatToPicColors.dsModalBackgroundColor
          : Colors.black;

      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
