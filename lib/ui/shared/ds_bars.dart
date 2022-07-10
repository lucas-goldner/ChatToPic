import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/constants/ds_bar_constants.dart';
import 'package:chattopic/ui/painters/ds_bottom_bar_background_painter.dart';
import 'package:chattopic/ui/painters/ds_top_bar_background_painter.dart';
import 'package:flutter/material.dart';

class DSBars extends StatelessWidget {
  final FavoriteColor color;

  const DSBars(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        CustomPaint(
          painter: DSTopBarBackgroundPainter(color),
          size: Size(size.width, DSBarConstants.barHeight),
        ),
        const Spacer(),
        CustomPaint(
          painter: DSBottomBarBackgroundPainter(color),
          size: Size(size.width, DSBarConstants.barHeight),
        ),
      ],
    );
  }
}
