import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/style/constants/ds_name_input_constants.dart';
import 'package:flutter/material.dart';

class OnboardingNameInputBorders extends StatelessWidget {
  const OnboardingNameInputBorders({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                height: DSNameInputConstants.containerHeight,
                width: DSNameInputConstants.innerContainerWidth,
                child: Center(
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
