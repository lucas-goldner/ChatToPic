import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:flutter/material.dart';

const double _barHeight = 88;

class DSBars extends StatelessWidget {
  final FavoriteColor color;

  const DSBars(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: _barHeight,
          width: size.width,
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(width: 2, color: Colors.black),
            ),
            gradient: color.getTopGradientOfColor(),
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
            gradient: color.getBottomGradientOfColor(),
          ),
        ),
      ],
    );
  }
}
