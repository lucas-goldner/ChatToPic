import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/onboarding/color/onboarding_color_select.dart';
import 'package:chattopic/ui/shared/dashed_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingColor extends StatefulWidget {
  const OnboardingColor({Key? key}) : super(key: key);

  @override
  State<OnboardingColor> createState() => _OnboardingColorState();
}

class _OnboardingColorState extends State<OnboardingColor> {
  Future<void> selectColor(favColor) async =>
      await context.read<SharedPrefCubit>().setFavoriteColor(favColor);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefCubit, SharedPrefState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: ChatToPicColorSelectConstants.spacingBetweenWidgets,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: ChatToPicColors.colorsContainerSecondBorder,
                    width: 2.0,
                  ),
                  right: BorderSide(
                    color: ChatToPicColors.colorsContainerSecondBorder,
                    width: 2.0,
                  ),
                ),
              ),
              child: Container(
                height: ChatToPicColorSelectConstants.colorsContainerSize,
                width: ChatToPicColorSelectConstants.colorsContainerSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: ChatToPicColors.colorsContainer,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 4.0,
                    ),
                    child: GridView.count(
                      crossAxisSpacing:
                          ChatToPicColorSelectConstants.gridCrossAxisSpacing,
                      mainAxisSpacing:
                          ChatToPicColorSelectConstants.gridMainAxisSpacing,
                      crossAxisCount:
                          ChatToPicColorSelectConstants.crossAxisCount,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      children: FavoriteColor.values.map(
                        (favColor) {
                          Color color = favColor.color;

                          return state.favoriteColor.color == color
                              ? GestureDetector(
                                  onTap: () => selectColor(favColor),
                                  child: DashedBorder(
                                    color: color,
                                    strokeWidth: ChatToPicColorSelectConstants
                                        .borderStrokeWidth,
                                    gap:
                                        ChatToPicColorSelectConstants.borderGap,
                                    child: Container(
                                      margin: const EdgeInsets.all(4.0),
                                      padding: const EdgeInsets.all(4.0),
                                      width: ChatToPicColorSelectConstants
                                          .colorSize,
                                      height: ChatToPicColorSelectConstants
                                          .colorSize,
                                      color: color,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () => selectColor(favColor),
                                  child: Container(
                                    margin: const EdgeInsets.all(4.0),
                                    color: color,
                                    width:
                                        ChatToPicColorSelectConstants.colorSize,
                                    height:
                                        ChatToPicColorSelectConstants.colorSize,
                                  ),
                                );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            ),
            const OnboardingColorSelect(),
          ],
        ),
      ),
    );
  }
}
