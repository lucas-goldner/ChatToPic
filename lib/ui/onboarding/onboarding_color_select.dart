import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/shared/dashed_border.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class OnboardingColorSelect extends StatefulWidget {
  const OnboardingColorSelect({Key? key}) : super(key: key);

  @override
  State<OnboardingColorSelect> createState() => _OnboardingColorSelectState();
}

const _colorsContainerSize = 300.0;
const _selectedColorContainerHeight = 140.0;
const _selectedColorContainerWidth = 120.0;
const _selectedColorHeight = 140.0;
const _selectedColorWidth = 120.0;
const _spacingBetweenWidgets = 16.0;
const _colorSize = 16.0;

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
        spacing: _spacingBetweenWidgets,
        children: [
          Container(
            height: _colorsContainerSize,
            width: _colorsContainerSize,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
                child: GridView.count(
                  crossAxisSpacing: 28,
                  mainAxisSpacing: 28,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  children: FavoriteColor.values
                      .mapIndexed(
                        (index, favColor) => selectedColorIndex == index
                            ? GestureDetector(
                                onTap: () => selectColor(index),
                                child: DashedBorder(
                                  color: favColor.getColor(),
                                  strokeWidth: 3.0,
                                  gap: 4.0,
                                  child: Container(
                                    margin: const EdgeInsets.all(4.0),
                                    padding: const EdgeInsets.all(4.0),
                                    width: _colorSize,
                                    height: _colorSize,
                                    color: favColor.getColor(),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () => selectColor(index),
                                child: Container(
                                  margin: const EdgeInsets.all(4.0),
                                  color: favColor.getColor(),
                                  width: _colorSize,
                                  height: _colorSize,
                                ),
                              ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          Container(
            height: _selectedColorContainerHeight,
            width: _selectedColorContainerWidth,
            margin: const EdgeInsets.only(top: 24),
            color: Colors.grey,
            child: Container(
              height: _selectedColorHeight,
              width: _selectedColorWidth,
              margin: const EdgeInsets.only(top: 24),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
