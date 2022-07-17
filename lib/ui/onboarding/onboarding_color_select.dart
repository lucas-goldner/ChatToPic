import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/constants/chat_to_pic_color_select_constants.dart';
import 'package:chattopic/ui/shared/dashed_border.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OnboardingColorSelect extends StatefulWidget {
  const OnboardingColorSelect({Key? key}) : super(key: key);

  @override
  State<OnboardingColorSelect> createState() => _OnboardingColorSelectState();
}

class _OnboardingColorSelectState extends State<OnboardingColorSelect> {
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
            height: ChatToPicColorSelectConstants.colorsContainerSize,
            width: ChatToPicColorSelectConstants.colorsContainerSize,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
                child: GridView.count(
                  crossAxisSpacing:
                      ChatToPicColorSelectConstants.gridCrossAxisSpacing,
                  mainAxisSpacing:
                      ChatToPicColorSelectConstants.gridMainAxisSpacing,
                  crossAxisCount: ChatToPicColorSelectConstants.crossAxisCount,
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
                                width: ChatToPicColorSelectConstants.colorSize,
                                height: ChatToPicColorSelectConstants.colorSize,
                              ),
                            );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
          Container(
            height: ChatToPicColorSelectConstants.selectedColorContainerHeight,
            width: ChatToPicColorSelectConstants.selectedColorContainerWidth,
            margin: const EdgeInsets.only(top: 24),
            color: Colors.grey,
            child: Container(
              height: ChatToPicColorSelectConstants.selectedColorHeight,
              width: ChatToPicColorSelectConstants.selectedColorWidth,
              margin: const EdgeInsets.only(top: 24),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
