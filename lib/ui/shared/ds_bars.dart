import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/style/constants/ds_bar_constants.dart';
import 'package:chattopic/ui/style/painters/ds_bottom_bar_background_painter.dart';
import 'package:chattopic/ui/style/painters/ds_top_bar_background_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/shared_pref/shared_pref_state.dart';

class DSBars extends StatelessWidget {
  const DSBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocSelector<SharedPrefCubit, SharedPrefState, FavoriteColor>(
      selector: (state) => state.favoriteColor,
      builder: (context, favColor) => Column(
        children: [
          CustomPaint(
            painter: DSTopBarBackgroundPainter(favColor),
            size: Size(size.width, DSBarConstants.barHeight),
          ),
          const Spacer(),
          CustomPaint(
            painter: DSBottomBarBackgroundPainter(favColor),
            size: Size(size.width, DSBarConstants.barHeight),
          ),
        ],
      ),
    );
  }
}
