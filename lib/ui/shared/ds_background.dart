import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
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

class DSBackgroundPainter extends CustomPainter {
  final Size size;
  const DSBackgroundPainter(this.size) : super();

  @override
  void paint(Canvas canvas, Size size) {
    _paintLinesBackground(canvas, size);
    _paintSquares(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void _paintLinesBackground(Canvas canvas, Size size) {
    // ScaleFactor is used to scale the background to the whole screen.
    double scaleFactor = 0.1;
    int two = 2;
    final paint = Paint()
      ..color = ChatToPicColors.dsGreyBackground
      ..strokeWidth = 1;

    for (double index = 0; index <= size.height / scaleFactor; index++) {
      final postion1 = Offset(0, index);
      final postion2 = Offset(size.width, index);
      paint.color =
          index % two == 0 ? ChatToPicColors.dsGreyBackground : Colors.white;

      canvas.drawLine(postion1, postion2, paint);
    }
  }

  void _paintSquares(Canvas canvas, Size size) {
    double scaleFactor = 0.1;
    int squareSize = 50;
    int squarePosition2Offset = 100;
    int squareHeight = squareSize + squarePosition2Offset;

    for (int index = 0;
        index <= size.height / scaleFactor;
        index += squareHeight) {
      _paintSquaresRow(canvas, size, index, squareSize);
    }
  }

  void _paintSquaresRow(
    Canvas canvas,
    Size size,
    int squareStartingPoint,
    int squareSize,
  ) {
    final paint = Paint()
      ..color = ChatToPicColors.dsSquareOutlineColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    int postion1Iterator = 0;
    double scaleFactor = 0.1;
    int distanceToNextSquareMultiplier = 3;
    for (int index = squareSize;
        index <= size.width / scaleFactor;
        index += squareSize) {
      final postion1 =
          Offset(postion1Iterator * 1 / 4, squareStartingPoint * 1 / 4);
      final postion2 = Offset(index * 3 / 4, squareSize * 3 / 4);

      final rect = Rect.fromPoints(postion1, postion2);
      canvas.drawRect(rect, paint);
      postion1Iterator += squareSize * distanceToNextSquareMultiplier;
    }
  }
}
