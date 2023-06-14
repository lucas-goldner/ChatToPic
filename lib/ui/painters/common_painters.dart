import 'dart:ui';

import 'package:chattopic/helper/canvas_args.dart';

class Commonpainters {
  void drawRect(Offset startPoint, Offset endPoint, CanvasArgs canvasArgs) {
    Rect rect = Rect.fromPoints(startPoint, endPoint);
    canvasArgs.canvas.drawRect(
      rect,
      canvasArgs.paint,
    );
  }

  void pixelizedRow(
    CanvasArgs canvasArgs,
    Color color,
    Color lightenedColor,
    double yOffset,
  ) {
    double dashWidth = 4;
    double dashSpace = 4;
    double startX = 2;
    double startX2 = 6;
    Paint paint = canvasArgs.paint;
    final canvasWidth = canvasArgs.size.width;
    final width = canvasWidth - 6;

    // Draw squares X and Y ordered like
    // X Y
    // Y X
    while (startX < width) {
      paint.color = color;
      final startPoint = Offset(startX, yOffset);
      final endPoint = Offset(startX + dashWidth, dashWidth + yOffset);
      drawRect(startPoint, endPoint, canvasArgs);

      final startPoint2 = Offset(startX2, yOffset + dashWidth);
      final endPoint2 =
          Offset(startX2 + dashWidth, dashWidth + dashWidth + yOffset);
      drawRect(startPoint2, endPoint2, canvasArgs);

      paint.color = lightenedColor;
      final startPoint3 = Offset(startX2, yOffset);
      final endPoint3 = Offset(startX2 + dashWidth, dashWidth + yOffset);
      drawRect(startPoint3, endPoint3, canvasArgs);

      final startPoint4 = Offset(startX, dashWidth + yOffset);
      final endPoint4 =
          Offset(startX + dashWidth, dashWidth + dashWidth + yOffset);
      drawRect(startPoint4, endPoint4, canvasArgs);

      startX += dashWidth + dashSpace;
      startX2 += dashWidth + dashSpace;
    }

    // Print final pixel row since a piece is missing when width is reduced by 6.
    paint.color = color;
    final finalStartPoint = Offset(startX, yOffset);
    final finalEndPoint = Offset(startX + dashWidth, dashWidth + yOffset);
    drawRect(finalStartPoint, finalEndPoint, canvasArgs);

    paint.color = lightenedColor;
    final finalStartPoint2 = Offset(startX, dashWidth + yOffset);
    final finalEndPoint2 =
        Offset(startX + dashWidth, dashWidth + dashWidth + yOffset);
    drawRect(finalStartPoint2, finalEndPoint2, canvasArgs);
  }
}
