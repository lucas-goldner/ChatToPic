import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/shared/ds_button.dart';
import 'package:flutter/cupertino.dart';

class OnboardingNameInputButtonRow extends StatelessWidget {
  const OnboardingNameInputButtonRow({
    required this.onErase,
    required this.onContinue,
    super.key,
  });
  final VoidCallback onErase;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final translate = S.of(context);

    return Column(
      children: [
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DSButton(
              title: translate.erase,
              letter: "B",
              callback: onErase,
            ),
            const SizedBox(
              width: 40,
            ),
            DSButton(
              title: translate.input,
              letter: "A",
              callback: onContinue,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
