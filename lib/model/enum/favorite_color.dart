import 'package:chattopic/ui/style/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

enum FavoriteColor {
  grey(ChatToPicColors.dsGreyColor),
  brown(ChatToPicColors.dsBrownColor),
  red(ChatToPicColors.dsRedColor),
  cottonCandy(ChatToPicColors.dsCottonCandyColor),
  orange(ChatToPicColors.dsOrangeColor),
  yellow(ChatToPicColors.dsYellowColor),
  limeGreen(ChatToPicColors.dsLimeGreenColor),
  green(ChatToPicColors.dsGreenColor),
  darkGreen(ChatToPicColors.dsDarkGreenColor),
  emerald(ChatToPicColors.dsEmeraldColor),
  skyBlue(ChatToPicColors.dsSkyBlueColor),
  blue(ChatToPicColors.dsBlueColor),
  darkBlue(ChatToPicColors.dsDarkBlueColor),
  purple(ChatToPicColors.dsPurpleColor),
  lightPurple(ChatToPicColors.dsLightPurpleColor),
  pink(ChatToPicColors.dsPinkColor);

  const FavoriteColor(this.color);
  final Color color;

  LinearGradient getTopGradientOfColor() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          color,
        ],
        stops: const [0.0, 0.9],
      );

  LinearGradient getBottomGradientOfColor() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          color,
          Colors.white,
        ],
        stops: const [0.2, 1],
      );
}
