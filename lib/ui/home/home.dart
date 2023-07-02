import 'package:chattopic/generated/l10n.dart';
import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:chattopic/ui/shared/ds_bars.dart';
import 'package:chattopic/ui/shared/ds_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final translate = S.of(context);

    return Stack(
      children: [
        const DSBackground(
          key: Key("HomeBackground"),
        ),
        const DSBars(
          key: Key("HomeBars"),
        ),
        const Center(
          child: Text("HOME"),
        ),
        Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DSButton(
                  key: const Key("HomeSettings"),
                  title: translate.settings,
                  letter: "B",
                  optionalButtonXOffset: 20,
                ),
                const SizedBox(
                  width: 40,
                ),
                DSButton(
                  key: const Key("HomeJoin"),
                  title: translate.join,
                  letter: "A",
                  optionalButtonXOffset: 36,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
