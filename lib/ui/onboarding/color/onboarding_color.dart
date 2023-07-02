import 'package:chattopic/ui/onboarding/color/widgets/onboarding_color_select.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/onboarding/color/widgets/onboarding_color_display_selected_color.dart';
import 'package:flutter/material.dart';

class OnboardingColor extends StatelessWidget {
  const OnboardingColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Padding(
        key: Key("OnboardingColor"),
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: ChatToPicColorSelectConstants.spacingBetweenWidgets,
          children: [
            OnboardingColorSelect(
              key: Key("OnboardingColorSelect"),
            ),
            OnboardingColorDisplaySelectedColor(
              key: Key("OnboardingColorDisplaySelectedColor"),
            ),
          ],
        ),
      );
}
