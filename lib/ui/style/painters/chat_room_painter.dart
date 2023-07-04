import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/ui/style/painters/common_painters.dart';
import 'package:flutter/material.dart';

class ChatRoomPainter extends CustomPainter {
  ChatRoomPainter({double? optionalButtonXOffset})
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

    paint.color = const Color.fromARGB(255, 199, 199, 198);
    canvas.drawLine(
      const Offset(1, 2),
      Offset(size.width, 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  _paintBackground(CanvasArgs canvasArgs) {
    final commonPainters = Commonpainters();
    commonPainters.pixelizedRow(
      canvasArgs,
      Colors.white,
      Colors.white,
      0,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 255, 255, 255),
      const Color.fromARGB(255, 242, 242, 242),
      8,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 255, 255, 255),
      const Color.fromARGB(255, 242, 242, 242),
      16,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 227, 227, 227),
      const Color.fromARGB(255, 242, 242, 242),
      24,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 242, 242, 242),
      const Color.fromARGB(255, 227, 227, 227),
      30,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 242, 242, 242),
      const Color.fromARGB(255, 227, 227, 227),
      38,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 199, 199, 198),
      const Color.fromARGB(255, 213, 213, 213),
      44,
    );

    commonPainters.pixelizedRow(
      canvasArgs,
      const Color.fromARGB(255, 199, 199, 198),
      const Color.fromARGB(255, 213, 213, 213),
      52,
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
