import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:chattopic/ui/onboarding/onboarding_color_select.dart';
import 'package:chattopic/ui/shared/dashed_border.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OnboardingColor extends StatefulWidget {
  const OnboardingColor({Key? key}) : super(key: key);

  @override
  State<OnboardingColor> createState() => _OnboardingColorState();
}

class _OnboardingColorState extends State<OnboardingColor> {
  int selectedColorIndex = 0;

  void selectColor(index) => setState(() => selectedColorIndex = index);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    children: FavoriteColor.values.mapIndexed(
                      (index, favColor) {
                        Color color = favColor.getColor();

                        return selectedColorIndex == index
                            ? GestureDetector(
                                onTap: () => selectColor(index),
                                child: DashedBorder(
                                  color: color,
                                  strokeWidth: ChatToPicColorSelectConstants
                                      .borderStrokeWidth,
                                  gap: ChatToPicColorSelectConstants.borderGap,
                                  child: Container(
                                    margin: const EdgeInsets.all(4.0),
                                    padding: const EdgeInsets.all(4.0),
                                    width:
                                        ChatToPicColorSelectConstants.colorSize,
                                    height:
                                        ChatToPicColorSelectConstants.colorSize,
                                    color: color,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () => selectColor(index),
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
    );
  }
}
