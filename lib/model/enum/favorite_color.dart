import 'package:chattopic/ui/constants/chat_to_pic_colors.dart';
import 'package:flutter/material.dart';

enum FavoriteColor {
  grey,
  brown,
  red,
  cottonCandy,
  orange,
  yellow,
  limeGreen,
  green,
  darkGreen,
  emerald,
  skyBlue,
  blue,
  darkBlue,
  purple,
  lightPurple,
  pinkColor
}

extension FavoriteColorExtension on FavoriteColor {
  Color getColor() {
    switch (this) {
      case FavoriteColor.grey:
        return ChatToPicColors.dsGreyColor;
      case FavoriteColor.brown:
        return ChatToPicColors.dsBrownColor;
      case FavoriteColor.red:
        return ChatToPicColors.dsRedColor;
      case FavoriteColor.cottonCandy:
        return ChatToPicColors.dsCottonCandyColor;
      case FavoriteColor.orange:
        return ChatToPicColors.dsOrangeColor;
      case FavoriteColor.yellow:
        return ChatToPicColors.dsYellowColor;
      case FavoriteColor.limeGreen:
        return ChatToPicColors.dsLimeGreenColor;
      case FavoriteColor.green:
        return ChatToPicColors.dsGreenColor;
      case FavoriteColor.darkGreen:
        return ChatToPicColors.dsDarkGreenColor;
      case FavoriteColor.emerald:
        return ChatToPicColors.dsEmeraldColor;
      case FavoriteColor.skyBlue:
        return ChatToPicColors.dsSkyBlueColor;
      case FavoriteColor.blue:
        return ChatToPicColors.dsBlueColor;
      case FavoriteColor.darkBlue:
        return ChatToPicColors.dsDarkBlueColor;
      case FavoriteColor.purple:
        return ChatToPicColors.dsPurpleColor;
      case FavoriteColor.lightPurple:
        return ChatToPicColors.dsLightPurpleColor;
      case FavoriteColor.pinkColor:
        return ChatToPicColors.dsPinkColor;
      default:
        return ChatToPicColors.dsGreyColor;
    }
  }

  LinearGradient getTopGradientOfColor() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          getColor(),
        ],
        stops: const [0.0, 0.9],
      );

  LinearGradient getBottomGradientOfColor() => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomRight,
        colors: [
          getColor(),
          Colors.white,
        ],
        stops: const [0.2, 1],
      );
}
