import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/constants/chat_to_pic_text_styles.dart';
import 'package:chattopic/ui/constants/ds_name_input_constants.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input_names.dart';
import 'package:chattopic/ui/painters/ds_modal_background_painter.dart';
import 'package:flutter/material.dart';

class OnboardingNameInput extends StatelessWidget {
  const OnboardingNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomPaint(
            painter: DSModalBackgroundPainter(),
            size: const Size(
              DSNameInputConstants.orangeWidth,
              DSNameInputConstants.orangeHeight,
            ),
          ),
        ),
        Center(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                horizontal: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    vertical: BorderSide(
                      color: ChatToPicColors.dsModalOutlineColor,
                    ),
                    horizontal: BorderSide(
                      color: ChatToPicColors.dsModalOutlineColor,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    height: DSNameInputConstants.smallestHeight,
                    width: DSNameInputConstants.smallestWidth,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintStyle:
                                ChatToPicTextStyles().getDefaultTextStyle(
                              color: Colors.white,
                              letterSpacing: DSNameInputConstants.letterSpacing,
                            ),
                            hintText: "Username",
                          ),
                          style: ChatToPicTextStyles().getDefaultTextStyle(
                            fontsize: fontSize14,
                            color: Colors.white,
                            letterSpacing: DSNameInputConstants.letterSpacing,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const OnboardingNameInputNames(),
      ],
    );
  }
}
