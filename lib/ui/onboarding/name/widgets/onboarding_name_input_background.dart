import 'package:chattopic/ui/style/constants/ds_name_input_constants.dart';
import 'package:chattopic/ui/style/painters/ds_modal_background_painter.dart';
import 'package:flutter/cupertino.dart';

class OnboardingNameInputBackground extends StatelessWidget {
  const OnboardingNameInputBackground({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: CustomPaint(
          painter: DSModalBackgroundPainter(),
          size: const Size(
            DSNameInputConstants.orangeWidth,
            DSNameInputConstants.orangeHeight,
          ),
        ),
      );
}
