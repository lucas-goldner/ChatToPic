import 'package:chattopic/ui/style/painters/dashed_border_painter.dart';
import 'package:flutter/material.dart';

const _half = 2;

class DashedBorder extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double gap;
  final Widget child;

  const DashedBorder({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(strokeWidth / _half),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: color,
          strokeWidth: strokeWidth,
          gap: gap,
        ),
        child: child,
      ),
    );
  }
}
