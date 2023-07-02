import 'package:chattopic/ui/onboarding/color/widgets/onboarding_color_favoritecolors_options.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

class OnboardingColorSelect extends StatelessWidget {
  const OnboardingColorSelect({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: ChatToPicColors.colorsContainerSecondBorder,
              width: 2.0,
            ),
            right: BorderSide(
              color: ChatToPicColors.colorsContainerSecondBorder,
              width: 2.0,
            ),
          ),
        ),
        child: Container(
          height: ChatToPicColorSelectConstants.colorsContainerSize,
          width: ChatToPicColorSelectConstants.colorsContainerSize,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(
              BorderSide(
                color: ChatToPicColors.colorsContainer,
                width: 2.0,
              ),
            ),
          ),
          child: const Center(
            child: OnboardingColorFavoriteColorsOptions(),
          ),
        ),
      );
}
