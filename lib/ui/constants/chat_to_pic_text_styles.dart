import 'package:flutter/material.dart';

const _defaultFontSize = 12.0;
const _expectedLineHeight = 22.0;

const fontSize18 = 18.0;
const fontSize16 = 16.0;
const fontSize14 = 14.0;
const fontSize12 = 12.0;

class ChatToPicTextStyles {
  TextStyle getDefaultTextStyle({
    Color color = Colors.black,
    double fontsize = _defaultFontSize,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontsize,
      height: _expectedLineHeight / fontsize,
    );
  }
}
