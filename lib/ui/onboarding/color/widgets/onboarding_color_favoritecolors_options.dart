import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/shared/dashed_border.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_color_select_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingColorFavoriteColorsOptions extends StatelessWidget {
  const OnboardingColorFavoriteColorsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefCubit, SharedPrefState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 4.0,
        ),
        child: GridView.count(
          crossAxisSpacing: ChatToPicColorSelectConstants.gridCrossAxisSpacing,
          mainAxisSpacing: ChatToPicColorSelectConstants.gridMainAxisSpacing,
          crossAxisCount: ChatToPicColorSelectConstants.crossAxisCount,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          children: FavoriteColor.values.map(
            (favColor) {
              Color color = favColor.color;
              String colorAsString = favColor.color.toString();
              String colorKey =
                  'OnboardingColorFavoriteColorsOptions-$colorAsString';
              String selectedColorKey =
                  'OnboardingColorSelected-$colorAsString';

              return state.favoriteColor.color == color
                  ? DashedBorder(
                      key: Key(selectedColorKey),
                      color: color,
                      strokeWidth:
                          ChatToPicColorSelectConstants.borderStrokeWidth,
                      gap: ChatToPicColorSelectConstants.borderGap,
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        padding: const EdgeInsets.all(4.0),
                        width: ChatToPicColorSelectConstants.colorSize,
                        height: ChatToPicColorSelectConstants.colorSize,
                        color: color,
                      ),
                    )
                  : GestureDetector(
                      key: Key(colorKey),
                      onTap: () => context
                          .read<SharedPrefCubit>()
                          .setFavoriteColor(favColor),
                      child: Container(
                        margin: const EdgeInsets.all(4.0),
                        color: color,
                        width: ChatToPicColorSelectConstants.colorSize,
                        height: ChatToPicColorSelectConstants.colorSize,
                      ),
                    );
            },
          ).toList(),
        ),
      ),
    );
  }
}
