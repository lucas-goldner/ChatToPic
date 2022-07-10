import 'package:chattopic/extensions/color_extension.dart';
import 'package:chattopic/helper/canvas_args.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/constants/ds_bars_constants.dart';
import 'package:flutter/material.dart';

class DSBars extends StatelessWidget {
  final FavoriteColor color;

  const DSBars(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        CustomPaint(
          painter: DSBarBackgroundPainter(color),
          size: Size(size.width, DSBarConstants.barHeight),
        ),
        const Spacer(),
        Container(
          height: DSBarConstants.barHeight,
          width: size.width,
          decoration: BoxDecoration(
            border: const Border(
              top: BorderSide(width: 2, color: Colors.black),
            ),
            gradient: color.getBottomGradientOfColor(),
          ),
        ),
      ],
    );
  }
}

class DSBarBackgroundPainter extends CustomPainter {
  final FavoriteColor color;
  DSBarBackgroundPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.getColor()
      // Strokewidth = 1 causes the underlying canvas layer to blend with this one.
      ..strokeWidth = 2;
    final CanvasArgs canvasArgs = CanvasArgs(canvas, size, paint);

    for (double index = 0; index <= size.height; index++) {
      int intIndex = index.toInt();

      if (intIndex == DSBarConstants.sections.first.stop ||
          intIndex == DSBarConstants.sections[2].stop) {
        _pixelizedRow(
          canvasArgs,
          color.getColor().lighten(
                intIndex == 0
                    ? DSBarConstants.sections.first.lightenValue
                    : DSBarConstants.sections[1].lightenValue,
              ),
          color.getColor().lighten(
                intIndex == 0
                    ? DSBarConstants.sections[1].lightenValue
                    : DSBarConstants.sections[2].lightenValue,
              ),
          intIndex.toDouble(),
        );
      } else if (intIndex == DSBarConstants.sections[5].stop) {
        _pixelizedTripleRow(
          canvasArgs,
          color.getColor().lighten(40),
          color.getColor().lighten(30),
          intIndex.toDouble(),
        );
      } else {
        _paintRow(index, color.getColor(), canvasArgs);
      }
    }

    // Final border line.
    paint.color = Colors.black;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _paintRow(
    double index,
    Color color,
    CanvasArgs canvasArgs,
  ) {
    final postion1 = Offset(0, index);
    final postion2 = Offset(canvasArgs.size.width, index);

    if (index < DSBarConstants.sections[2].stop &&
        index >= DSBarConstants.sections[1].stop) {
      canvasArgs.paint.color = color.lighten(70);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[4].stop &&
        index > DSBarConstants.sections[3].stop) {
      canvasArgs.paint.color = color.lighten(50);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[5].stop &&
        index > DSBarConstants.sections[4].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[4].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[7].stop &&
        index > DSBarConstants.sections[6].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[6].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < DSBarConstants.sections[8].stop &&
        index > DSBarConstants.sections[7].stop) {
      canvasArgs.paint.color =
          color.lighten(DSBarConstants.sections[7].lightenValue);
      canvasArgs.canvas.drawLine(postion1, postion2, canvasArgs.paint);
    } else if (index < canvasArgs.size.height &&
        index > DSBarConstants.sections.last.stop) {
      canvasArgs.paint.color = color;
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
    double startX = 0;
    double startX2 = 4;
    Paint paint = canvasArgs.paint;

    // Draw squares X and Y ordered like
    // X Y
    // Y X
    while (startX < canvasArgs.size.width) {
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
  }

  void _pixelizedTripleRow(
    CanvasArgs canvasArgs,
    Color color,
    Color lightenedColor,
    double yOffset,
  ) {
    double dashWidth = 4;
    double dashSpace = 4;
    double startX = 0;
    double startX2 = 4;

    Paint paint = canvasArgs.paint;

    // Draw squares X and Y ordered like
    // X Y
    // Y X
    while (startX < canvasArgs.size.width) {
      paint.color = color;
      final startPoint = Offset(startX, yOffset);
      final endPoint = Offset(startX + dashWidth, dashWidth + yOffset);
      _drawRect(startPoint, endPoint, canvasArgs);

      final startPoint2 = Offset(startX2, yOffset + dashWidth);
      final endPoint2 =
          Offset(startX2 + dashWidth, dashWidth + dashWidth + yOffset);
      _drawRect(startPoint2, endPoint2, canvasArgs);

      final startPoint5 = Offset(startX, dashWidth + dashWidth + yOffset);
      final endPoint5 = Offset(
        startX + dashWidth,
        dashWidth + dashWidth + dashWidth + yOffset,
      );
      _drawRect(startPoint5, endPoint5, canvasArgs);

      paint.color = lightenedColor;
      final startPoint3 = Offset(startX2, yOffset);
      final endPoint3 = Offset(startX2 + dashWidth, dashWidth + yOffset);
      _drawRect(startPoint3, endPoint3, canvasArgs);

      final startPoint4 = Offset(startX, dashWidth + yOffset);
      final endPoint4 =
          Offset(startX + dashWidth, dashWidth + dashWidth + yOffset);
      _drawRect(startPoint4, endPoint4, canvasArgs);

      final startPoint6 = Offset(startX2, dashWidth + dashWidth + yOffset);
      final endPoint6 = Offset(
        startX2 + dashWidth,
        dashWidth + dashWidth + dashWidth + yOffset,
      );
      _drawRect(startPoint6, endPoint6, canvasArgs);

      startX += dashWidth + dashSpace;
      startX2 += dashWidth + dashSpace;
    }
  }
}
