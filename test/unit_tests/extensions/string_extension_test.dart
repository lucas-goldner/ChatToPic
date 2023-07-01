import 'package:chattopic/helper/extensions/string_extension.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Get favorite color from valid string', () {
    const stringColor = 'color(0xff61829a)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.grey));
  });

  test('Get favorite color from unknown string', () {
    const stringColor = 'color(0xffff0000)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.grey));
  });

  test('Get favorite color for CottonCandy', () {
    const stringColor = 'COLOR(0xfffb8afb)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.cottonCandy));
  });

  test('Get favorite color for Brown', () {
    const stringColor = 'color(0xffba4900)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.brown));
  });

  test('Get favorite color for Red', () {
    const stringColor = 'color(0xfffb0018)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.red));
  });

  test('Get favorite color for Orange', () {
    const stringColor = 'color(0xfffb9200)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.orange));
  });

  test('Get favorite color for Yellow', () {
    const stringColor = 'color(0xfff3e300)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.yellow));
  });

  test('Get favorite color for LimeGreen', () {
    const stringColor = 'color(0xffaafb00)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.limeGreen));
  });

  test('Get favorite color for Green', () {
    const stringColor = 'color(0xff00fb00)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.green));
  });

  test('Get favorite color for DarkGreen', () {
    const stringColor = 'color(0xff00a238)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.darkGreen));
  });

  test('Get favorite color for Emerald', () {
    const stringColor = 'color(0xff49db8a)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.emerald));
  });

  test('Get favorite color for SkyBlue', () {
    const stringColor = 'color(0xff30baf3)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.skyBlue));
  });

  test('Get favorite color for DarkBlue', () {
    const stringColor = 'color(0xff000092)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.darkBlue));
  });

  test('Get favorite color for Purple', () {
    const stringColor = 'color(0xff8a00d3)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.purple));
  });

  test('Get favorite color for LightPurple', () {
    const stringColor = 'color(0xffd300eb)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.lightPurple));
  });

  test('Get favorite color for Pink', () {
    const stringColor = 'color(0xfffb0092)';
    final favoriteColor = stringColor.getFavoriteColorFromString();

    expect(favoriteColor, equals(FavoriteColor.pink));
  });
}
