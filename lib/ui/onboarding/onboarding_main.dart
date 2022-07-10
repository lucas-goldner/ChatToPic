import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:chattopic/ui/shared/ds_bars.dart';
import 'package:chattopic/ui/shared/ds_modal.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({Key? key}) : super(key: key);

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const DSBackground(),
        const DSBars(FavoriteColor.lightPurple),
        Center(
          child: DSModal(S.of(context).helloWorld),
        ),
      ],
    );
  }
}
