import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

class DSModalBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ScaleFactor is used to scale the background to the whole screen.

    int two = 2;
    final paint = Paint()
      ..color = ChatToPicColors.dsGreyBackground
      ..strokeWidth = 1;

    for (double index = 0; index <= size.height; index++) {
      final postion1 = Offset(0, index);
      final postion2 = Offset(size.width, index);
      paint.color = index % two == 0
          ? ChatToPicColors.dsModalBackgroundColor
          : Colors.black;

      canvas.drawLine(postion1, postion2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
