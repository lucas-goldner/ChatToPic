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
        currentWidget = OnboardingNameInput(goToNextPage);
        break;
      case 2:
        currentWidget = const OnboardingColor();
        break;
    }

    return GestureDetector(
      onTap: () => index == 0 ? goToNextPage() : null,
      child: Stack(
        children: [
          const DSBackground(),
          const DSBars(FavoriteColor.grey),
          Center(
            child: currentWidget,
          ),
          Visibility(
            visible: index == 2,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DSButton(
                      title: S.of(context).goBack,
                      letter: "B",
                      callback: () => setState(() => index -= 1),
                      optionalButtonXOffset: 20,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    DSButton(
                      title: S.of(context).select,
                      letter: "A",
                      optionalButtonXOffset: 32,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
