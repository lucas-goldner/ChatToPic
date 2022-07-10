import 'package:chattopic/ui/painters/ds_background_painter.dart';
import 'package:flutter/material.dart';

class DSBackground extends StatelessWidget {
  const DSBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return CustomPaint(
      painter: DSBackgroundPainter(size),
      size: size,
    );
  }
}
