import 'package:flutter/material.dart';

const _defaultPercentage = 10;

extension ColorExtension on Color {
  Color darken([int percent = _defaultPercentage]) {
    final modifier = 1 - percent / 100;

    return Color.fromARGB(
      alpha,
      (red * modifier).round(),
      (green * modifier).round(),
      (blue * modifier).round(),
    );
  }

  Color lighten([int percent = _defaultPercentage]) {
    final modifier = percent / 100;
    const maxRGBValue = 255;

    return Color.fromARGB(
      alpha,
      red + ((maxRGBValue - red) * modifier).round(),
      green + ((maxRGBValue - green) * modifier).round(),
      blue + ((maxRGBValue - blue) * modifier).round(),
    );
  }
}
