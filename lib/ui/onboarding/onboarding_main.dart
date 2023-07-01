import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/onboarding/onboarding_item.dart';
import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:chattopic/ui/shared/ds_bars.dart';
import 'package:chattopic/ui/shared/ds_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({Key? key}) : super(key: key);

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  int index = 0;

  void goToNextPage() => setState(() => index += 1);

  void goToLastPage() => setState(() => index -= 1);

  Future<void> finishOnboarding() async {
    await context.read<SharedPrefCubit>().setOnboardingDone(true);
  }

  @override
  Widget build(BuildContext context) {
    final translate = S.of(context);

    return GestureDetector(
      onTap: () => index == 0 ? goToNextPage() : null,
      child: Stack(
        children: [
          const DSBackground(),
          const DSBars(),
          Center(
            child: OnboardingItem(index, goToNextPage),
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
                      title: translate.goBack,
                      letter: "B",
                      callback: goToLastPage,
                      optionalButtonXOffset: 20,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    DSButton(
                      title: translate.select,
                      letter: "A",
                      optionalButtonXOffset: 28,
                      callback: finishOnboarding,
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
