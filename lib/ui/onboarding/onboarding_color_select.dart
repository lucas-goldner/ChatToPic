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

class _OnboardingColorSelectState extends State<OnboardingColorSelect> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: _colorsContainerSize,
            width: _colorsContainerSize,
            color: Colors.white,
          ),
          Container(
            height: _selectedColorContainerHeight,
            width: _selectedColorContainerWidth,
            margin: const EdgeInsets.only(top: 24),
            color: Colors.grey,
            child: Container(
              height: _selectedColorContainerHeight,
              width: _selectedColorContainerWidth,
              margin: const EdgeInsets.only(top: 24),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
