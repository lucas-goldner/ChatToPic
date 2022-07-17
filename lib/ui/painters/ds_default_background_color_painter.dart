import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/helper/extensions/color_extension.dart';
import 'package:chattopic/ui/constants/ds_default_background_constants.dart';
import 'package:flutter/material.dart';

class DSDefaultBackgroundColorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    final CanvasArgs canvasArgs = CanvasArgs(canvas, size, paint);

    int indexAtPixelRow = 62;

    for (double index = 0; index <= size.height; index++) {
      int intIndex = index.toInt();

      if (intIndex == DSDefaultBackgroundConstants.sections[7].stop ||
          intIndex == DSDefaultBackgroundConstants.sections.last.stop) {
        _pixelizedRow(
          canvasArgs,
          Colors.grey.lighten(
            intIndex == indexAtPixelRow
                ? DSDefaultBackgroundConstants.sections[7].lightenValue
                : DSDefaultBackgroundConstants.sections[8].lightenValue,
          ),
          Colors.grey.lighten(
            intIndex == indexAtPixelRow
                ? DSDefaultBackgroundConstants.sections[8].lightenValue
                : DSDefaultBackgroundConstants.sections.last.lightenValue,
          ),
          intIndex.toDouble(),
        );
      } else if (intIndex == DSDefaultBackgroundConstants.sections[4].stop) {
        _pixelizedRow(
          canvasArgs,
          Colors.grey.lighten(
            intIndex == indexAtPixelRow
                ? DSDefaultBackgroundConstants.sections[3].lightenValue
                : DSDefaultBackgroundConstants.sections[4].lightenValue,
          ),
          Colors.grey.lighten(
            intIndex == indexAtPixelRow
                ? DSDefaultBackgroundConstants.sections[4].lightenValue
                : DSDefaultBackgroundConstants.sections[5].lightenValue,
          ),
          intIndex.toDouble(),
        );
      } else {
        _paintRow(
          index,
          Colors.grey
              .lighten(DSDefaultBackgroundConstants.sections[1].lightenValue),
          canvasArgs,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _paintRow(
    double index,
    Color color,
    CanvasArgs canvasArgs,
  ) {
    final postion1 = Offset(2, index);
    final postion2 = Offset(canvasArgs.size.width, index);
    final section1 = DSDefaultBackgroundConstants.sections[1].stop;
    final section2 = DSDefaultBackgroundConstants.sections[2].stop;
    final section6 = DSDefaultBackgroundConstants.sections[6].stop;
    final section7 = DSDefaultBackgroundConstants.sections[7].stop;

    if (index < section1 &&
        index >= DSDefaultBackgroundConstants.sections.first.stop) {
      canvasArgs.paint.color = color;
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < section2 && index > section1) {
      canvasArgs.paint.color = color.lighten(
        DSDefaultBackgroundConstants.sections[1].lightenValue,
      );
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSDefaultBackgroundConstants.sections[3].stop &&
        index > section2) {
      canvasArgs.paint.color = color.lighten(
        DSDefaultBackgroundConstants.sections[2].lightenValue,
      );
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < section7 && index > section6) {
      canvasArgs.paint.color = color.lighten(
        DSDefaultBackgroundConstants.sections[5].lightenValue,
      );
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSDefaultBackgroundConstants.sections[10].stop &&
        index > DSDefaultBackgroundConstants.sections[9].stop) {
      canvasArgs.paint.color = color.lighten(
        DSDefaultBackgroundConstants.sections[8].lightenValue,
      );
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    }
  }

  void _drawRect(Offset startPoint, Offset endPoint, CanvasArgs canvasArgs) {
    Rect rect = Rect.fromPoints(startPoint, endPoint);
    canvasArgs.canvas.drawRect(
      rect,
      canvasArgs.paint,
    );
  }

  void _pixelizedRow(
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
      _drawRect(startPoint, endPoint, canvasArgs);

      final startPoint2 = Offset(startX2, yOffset + dashWidth);
      final endPoint2 =
          Offset(startX2 + dashWidth, dashWidth + dashWidth + yOffset);
      _drawRect(startPoint2, endPoint2, canvasArgs);

      paint.color = lightenedColor;
      final startPoint3 = Offset(startX2, yOffset);
      final endPoint3 = Offset(startX2 + dashWidth, dashWidth + yOffset);
      _drawRect(startPoint3, endPoint3, canvasArgs);

      final startPoint4 = Offset(startX, dashWidth + yOffset);
      final endPoint4 =
          Offset(startX + dashWidth, dashWidth + dashWidth + yOffset);
      _drawRect(startPoint4, endPoint4, canvasArgs);

      startX += dashWidth + dashSpace;
      startX2 += dashWidth + dashSpace;
    }

    // Print final pixel row since a piece is missing when width is reduced by 6.
    paint.color = color;
    final finalStartPoint = Offset(startX, yOffset);
    final finalEndPoint = Offset(startX + dashWidth, dashWidth + yOffset);
    _drawRect(finalStartPoint, finalEndPoint, canvasArgs);

    paint.color = lightenedColor;
    final finalStartPoint2 = Offset(startX, dashWidth + yOffset);
    final finalEndPoint2 =
        Offset(startX + dashWidth, dashWidth + dashWidth + yOffset);
    _drawRect(finalStartPoint2, finalEndPoint2, canvasArgs);
  }
}
