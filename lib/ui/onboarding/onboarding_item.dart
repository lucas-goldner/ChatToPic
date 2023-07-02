import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/model/enum/onboarding_page.dart';
import 'package:chattopic/ui/onboarding/color/onboarding_color.dart';
import 'package:chattopic/ui/onboarding/name/onboarding_name_input.dart';
import 'package:chattopic/ui/shared/ds_modal.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(this.index, this.callback, {super.key});
  final int index;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    if (index == OnboardingPage.welcome.pageIndex) {
      return DSModal(S.of(context).beforeYouBegin);
    } else if (index == OnboardingPage.name.pageIndex) {
      return OnboardingNameInput(callback);
    } else if (index == OnboardingPage.color.pageIndex) {
      return const OnboardingColor();
    }

    return const SizedBox.shrink();
  }
}
