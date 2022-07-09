import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({Key? key}) : super(key: key);

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [DSBackground()],
    );
  }
}
