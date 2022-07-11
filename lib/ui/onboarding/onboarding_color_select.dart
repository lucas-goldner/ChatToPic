import 'package:chattopic/model/enum/favorite_color.dart';
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
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 32,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  children: FavoriteColor.values
                      .mapIndexed(
                        (index, favColor) => selectedColorIndex == index
                            ? Container(
                                width: _colorSize,
                                height: _colorSize,
                                decoration: BoxDecoration(
                                  color: favColor.getColor(),
                                  border: const Border.fromBorderSide(
                                    BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                color: favColor.getColor(),
                                width: _colorSize,
                                height: _colorSize,
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
