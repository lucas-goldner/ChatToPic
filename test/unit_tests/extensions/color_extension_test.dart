import 'package:chattopic/helper/extensions/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Darken color by default percentage', () {
    const color = Colors.blue;
    final darkenedColor = color.darken();

    expect(darkenedColor.red, equals(30));
    expect(darkenedColor.green, equals(135));
    expect(darkenedColor.blue, equals(219));
  });

  test('Darken color by custom percentage', () {
    const color = Colors.blue;
    final darkenedColor = color.darken(50);

    expect(darkenedColor.red, equals(17));
    expect(darkenedColor.green, equals(75));
    expect(darkenedColor.blue, equals(122));
  });

  test('Lighten color by default percentage', () {
    const color = Colors.blue;
    final lightenedColor = color.lighten();

    expect(lightenedColor.red, equals(55));
    expect(lightenedColor.green, equals(161));
    expect(lightenedColor.blue, equals(244));
  });

  test('Lighten color by custom percentage', () {
    const color = Colors.blue;
    final lightenedColor = color.lighten(50);

    expect(lightenedColor.red, equals(144));
    expect(lightenedColor.green, equals(203));
    expect(lightenedColor.blue, equals(249));
  });
}
