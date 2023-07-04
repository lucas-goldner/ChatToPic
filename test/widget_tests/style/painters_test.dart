import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/ui/style/painters/dashed_border_painter.dart';
import 'package:chattopic/ui/style/painters/ds_background_painter.dart';
import 'package:chattopic/ui/style/painters/ds_bottom_bar_background_painter.dart';
import 'package:chattopic/ui/style/painters/ds_button_painter.dart';
import 'package:chattopic/ui/style/painters/ds_default_background_color_painter.dart';
import 'package:chattopic/ui/style/painters/ds_modal_background_painter.dart';
import 'package:chattopic/ui/style/painters/ds_top_bar_background_painter.dart';
import 'package:chattopic/ui/style/painters/home_background_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test DashedBorderPainter shouldRepaint', () {
    final dashedborder =
        DashedBorderPainter(strokeWidth: 0, color: Colors.red, gap: 0);
    expect(dashedborder.shouldRepaint(dashedborder), true);
  });

  test('Test DSBackgroundPainter shouldRepaint', () {
    const dsBackgroundPainter = DSBackgroundPainter(Size(0, 0));
    expect(dsBackgroundPainter.shouldRepaint(dsBackgroundPainter), true);
  });

  test('Test DSBottomBarBackgroundPainter shouldRepaint', () {
    final dsBottomBarBackgroundPainter =
        DSBottomBarBackgroundPainter(FavoriteColor.blue);
    expect(
        dsBottomBarBackgroundPainter
            .shouldRepaint(dsBottomBarBackgroundPainter),
        true);
  });

  test('Test DSButtonPainter shouldRepaint', () {
    final dsButtonPainter = DSButtonPainter();
    expect(dsButtonPainter.shouldRepaint(dsButtonPainter), true);
  });

  test('Test DSDefaultBackgroundColorPainter shouldRepaint', () {
    final dsDefaultBackgroundColorPainter = DSDefaultBackgroundColorPainter();
    expect(
        dsDefaultBackgroundColorPainter
            .shouldRepaint(dsDefaultBackgroundColorPainter),
        true);
  });

  test('Test DSModalBackgroundPainter shouldRepaint', () {
    final dsModalBackgroundPainter = DSModalBackgroundPainter();
    expect(
        dsModalBackgroundPainter.shouldRepaint(dsModalBackgroundPainter), true);
  });

  test('Test DSTopBarBackgroundPainter shouldRepaint', () {
    final dsTopBarBackgroundPainter =
        DSTopBarBackgroundPainter(FavoriteColor.blue);
    expect(dsTopBarBackgroundPainter.shouldRepaint(dsTopBarBackgroundPainter),
        true);
  });

  test('Test HomeBackgroundPainter shouldRepaint', () {
    final homeBackgroundPainter = HomeBackgroundPainter();
    expect(homeBackgroundPainter.shouldRepaint(homeBackgroundPainter), true);
  });
}
