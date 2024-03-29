import 'package:chattopic/ui/style/painters/ds_background_painter.dart';
import 'package:flutter/material.dart';

class DSBackground extends StatelessWidget {
  const DSBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return CustomPaint(
      painter: DSBackgroundPainter(size),
      size: size,
    );
  }
}
