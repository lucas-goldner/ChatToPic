import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/shared/ds_background.dart';
import 'package:flutter/material.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({Key? key}) : super(key: key);

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

const double _barHeight = 88;

class _OnboardingMainState extends State<OnboardingMain> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const DSBackground(),
        Column(
          children: [
            Container(
              height: _barHeight,
              width: size.width,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(width: 2, color: Colors.black),
                ),
                gradient: FavoriteColor.emerald.getTopGradientOfColor(),
              ),
            ),
            const Spacer(),
            Container(
              height: _barHeight,
              width: size.width,
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(width: 2, color: Colors.black),
                ),
                gradient: FavoriteColor.emerald.getBottomGradientOfColor(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
