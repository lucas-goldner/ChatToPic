import 'package:flutter/material.dart';
import 'dart:math' as math;

class DashedBorderPainter extends CustomPainter {
  double strokeWidth;
  Color color;
  double gap;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.color,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint dashedPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double xValue = size.width;
    double yValue = size.height;

    Path topPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(xValue, 0),
      gap: gap,
    );

    Path rightPath = getDashedPath(
      a: math.Point(xValue, 0),
      b: math.Point(xValue, yValue),
      gap: gap,
    );

    Path bottomPath = getDashedPath(
      a: math.Point(0, yValue),
      b: math.Point(xValue, yValue),
      gap: gap,
    );

    Path leftPath = getDashedPath(
      a: const math.Point(0, 0),
      b: math.Point(0.001, yValue),
      gap: gap,
    );

    canvas.drawPath(topPath, dashedPaint);
    canvas.drawPath(rightPath, dashedPaint);
    canvas.drawPath(bottomPath, dashedPaint);
    canvas.drawPath(leftPath, dashedPaint);
  }

  Path getDashedPath({
    required math.Point<double> a,
    required math.Point<double> b,
    required gap,
  }) {
    Size size = Size(b.x - a.x, b.y - a.y);
    Path path = Path();
    path.moveTo(a.x, a.y);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.x, a.y);

    num radians = math.atan(size.height / size.width);
    num cos = math.cos(radians);
    num sin = math.sin(radians);
    num dxPoint = cos * gap < 0 ? cos * gap * -1 : cos * gap;
    num dyPoint = sin * gap < 0 ? sin * gap * -1 : sin * gap;

    while (currentPoint.x <= b.x && currentPoint.y <= b.y) {
      shouldDraw
          ? path.lineTo(currentPoint.x.toDouble(), currentPoint.y.toDouble())
          : path.moveTo(currentPoint.x.toDouble(), currentPoint.y.toDouble());
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dxPoint,
        currentPoint.y + dyPoint,
      );
    }

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
