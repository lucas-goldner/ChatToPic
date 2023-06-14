import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/onboarding/color/onboarding_color.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input.dart';
import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:chattopic/ui/shared/ds_bars.dart';
import 'package:chattopic/ui/shared/ds_button.dart';
import 'package:chattopic/ui/shared/ds_modal.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({Key? key}) : super(key: key);

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  int index = 0;

  void goToNextPage() {
    setState(() => index += 1);
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget = const SizedBox.shrink();

    switch (index) {
      case 0:
        currentWidget = DSModal(S.of(context).beforeYouBegin);
        break;
      case 1:
        currentWidget = const OnboardingNameInput();
        break;
      case 2:
        currentWidget = const OnboardingColor();
        break;
    }

    return Stack(
      children: [
        const DSBackground(),
        const DSBars(FavoriteColor.grey),
        GestureDetector(
          onTap: goToNextPage,
          child: Center(
            child: currentWidget,
          ),
        ),
        const Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSButton(
                  title: "Erase",
                  letter: "B",
                ),
                SizedBox(
                  width: 40,
                ),
                DSButton(
                  title: "Input",
                  letter: "A",
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
