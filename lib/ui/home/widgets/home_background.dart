import 'package:chattopic/ui/style/painters/home_background_painter.dart';
import 'package:flutter/material.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return CustomPaint(
      painter: HomeBackgroundPainter(),
      size: size,
    );
  }
}
