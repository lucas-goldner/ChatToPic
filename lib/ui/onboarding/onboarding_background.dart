import 'package:chattopic/ui/onboarding/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: MyPainter(size),
      size: Size(size.width, size.height),
    );
  }
}

class MyPainter extends CustomPainter {
  final Size size;

  const MyPainter(this.size) : super();

  @override
  void paint(Canvas canvas, Size size) {
    for (double index = 0; index <= size.height / 0.1; index++) {
      final p1 = Offset(0, index);
      final p2 = Offset(size.width, index);

      final paint = Paint()
        ..color =
            index % 2 == 0 ? ChatToPicColors.dsGreyBackground : Colors.white
        ..strokeWidth = 10;
      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter _) {
    return false;
  }
}
