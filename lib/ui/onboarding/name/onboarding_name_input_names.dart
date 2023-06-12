import 'package:chattopic/ui/constants/ds_name_input_constants.dart';
import 'package:flutter/material.dart';

class OnboardingNameInputNames extends StatelessWidget {
  const OnboardingNameInputNames({super.key});
  final letterLimit = 10;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(
            letterLimit,
            (index) => Container(
              height: DSNameInputConstants.orangeHeight -
                  DSNameInputConstants.squaresSpacing,
              width: (DSNameInputConstants.orangeWidth / letterLimit) -
                  (DSNameInputConstants.squaresSpacing / 10),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.grey.withAlpha(72),
                    width: 2.0,
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
