import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/painters/ds_default_background_color_painter.dart';
import 'package:flutter/material.dart';

class OnboardingColorSelect extends StatelessWidget {
  const OnboardingColorSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ChatToPicColorSelectConstants.selectedColorHeight,
          width: ChatToPicColorSelectConstants.selectedColorWidth,
          margin: const EdgeInsets.only(top: 24),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border.fromBorderSide(
              BorderSide(
                color: ChatToPicColors.colorsContainer,
                width: 2.0,
              ),
            ),
          ),
          child: Center(
            child: Container(
              color: Colors.red,
              width: ChatToPicColorSelectConstants.selectedColorSize,
              height: ChatToPicColorSelectConstants.selectedColorSize,
            ),
          ),
        ),
        Container(
          height:
              ChatToPicColorSelectConstants.selectedColorContainerBannerHeight,
          width: ChatToPicColorSelectConstants.selectedColorContainerWidth,
          margin: const EdgeInsets.only(top: 24),
          decoration: const BoxDecoration(
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
          child: CustomPaint(
            size: const Size(
              ChatToPicColorSelectConstants.selectedColorContainerWidth,
              ChatToPicColorSelectConstants.selectedColorContainerBannerHeight,
            ),
            painter: DSDefaultBackgroundColorPainter(),
            child: Center(child: Text(S.of(context).chooseColor)),
          ),
        ),
      ],
    );
  }
}
