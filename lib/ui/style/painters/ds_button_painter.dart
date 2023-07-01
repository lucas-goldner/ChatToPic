import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/ui/style/painters/common_painters.dart';
import 'package:flutter/material.dart';

class DSButtonPainter extends CustomPainter {
  DSButtonPainter({double? optionalButtonXOffset})
      : buttonXOffset = optionalButtonXOffset ?? 36;
  final double buttonXOffset;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 2;
    final CanvasArgs canvasArgs = CanvasArgs(canvas, size, paint);

    _paintBackground(canvasArgs);

    paint.color = Colors.white;
    canvas.drawLine(
      const Offset(0, 0),
      Offset(size.width, 0),
      paint,
    );
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
    _paintVerticalLine(0, canvasArgs);
    _paintVerticalLine(size.width, canvasArgs);

    paint.color = const Color.fromRGBO(184, 184, 182, 1);
    canvas.drawLine(
      const Offset(1, 1),
      Offset(size.width, 1),
      paint,
    );
    _paintVerticalLine(2, canvasArgs);
    _paintVerticalLine(size.width - 1, canvasArgs);

    paint.color = Colors.black;
    _paintDrawLetterButton(canvasArgs, buttonXOffset);

    paint.color = const Color.fromARGB(255, 199, 199, 198);
    canvas.drawLine(
      const Offset(1, 2),
      Offset(size.width, 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  _paintBackground(CanvasArgs canvasArgs) {
    Commonpainters().pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 199, 199, 198),
      const Color.fromARGB(255, 213, 213, 213),
      2,
    );

    Commonpainters().pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 215, 215, 215),
      const Color.fromARGB(255, 230, 230, 230),
      10,
    );

    Commonpainters().pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 227, 227, 227),
      const Color.fromARGB(255, 242, 242, 242),
      18,
    );

    Commonpainters().pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 255, 255, 255),
      const Color.fromARGB(255, 242, 242, 242),
      24,
    );
  }

  _paintDrawLetterButton(CanvasArgs canvasArgs, double xPos) {
    double basicSize = 12;

    canvasArgs.canvas.drawRect(
      Rect.fromCenter(
        center: Offset(xPos, 16),
        width: basicSize + 2,
        height: basicSize + 2,
      ),
      canvasArgs.paint,
    );

    canvasArgs.canvas.drawRect(
      Rect.fromCenter(
        center: Offset(xPos, 16),
        width: basicSize - 2,
        height: basicSize + 6,
      ),
      canvasArgs.paint,
    );

    canvasArgs.canvas.drawRect(
      Rect.fromCenter(
        center: Offset(xPos, 16),
        width: basicSize + 6,
        height: basicSize - 2,
      ),
      canvasArgs.paint,
    );
  }

  _paintVerticalLine(double xPos, CanvasArgs canvasArgs) {
    canvasArgs.canvas.drawLine(
      Offset(xPos, 0),
      Offset(xPos, canvasArgs.size.height),
      canvasArgs.paint,
    );
  }
}
