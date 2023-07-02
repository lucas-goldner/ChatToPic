import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:flutter/material.dart';
import 'package:test/test.dart';

void main() {
  test('Get top gradient of favorite color', () {
    const favoriteColor = FavoriteColor.grey;
    final gradient = favoriteColor.getTopGradientOfColor();

    expect(gradient.colors, equals([Colors.white, FavoriteColor.grey.color]));
    expect(gradient.stops, equals([0.0, 0.9]));
  });

  test('Get bottom gradient of favorite color', () {
    const favoriteColor = FavoriteColor.green;
    final gradient = favoriteColor.getBottomGradientOfColor();

    expect(gradient.colors, equals([FavoriteColor.green.color, Colors.white]));
    expect(gradient.stops, equals([0.2, 1]));
  });
}
