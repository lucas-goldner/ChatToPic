import 'package:chattopic/ui/style/constants/ds_name_input_constants.dart';
import 'package:flutter/material.dart';

class OnboardingNameInputNamesSquares extends StatelessWidget {
  const OnboardingNameInputNamesSquares({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            DSNameInputConstants.letterLimit,
            (index) => Container(
              height: DSNameInputConstants.orangeHeight -
                  DSNameInputConstants.squaresSpacing,
              width: (DSNameInputConstants.orangeWidth /
                      DSNameInputConstants.letterLimit) -
                  (DSNameInputConstants.squaresSpacing /
                      DSNameInputConstants.letterLimit),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color:
                        Colors.grey.withAlpha(DSNameInputConstants.borderAlpha),
                    width: DSNameInputConstants.borderWidth,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
