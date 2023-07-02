import 'package:chattopic/model/enum/favorite_color.dart';

extension StringExtension on String {
  FavoriteColor getFavoriteColorFromString() {
    switch (toLowerCase()) {
      case "color(0xff61829a)":
        return FavoriteColor.grey;
      case 'color(0xffba4900)':
        return FavoriteColor.brown;
      case 'color(0xfffb0018)':
        return FavoriteColor.red;
      case 'color(0xfffb8afb)':
        return FavoriteColor.cottonCandy;
      case 'color(0xfffb9200)':
        return FavoriteColor.orange;
      case 'color(0xfff3e300)':
        return FavoriteColor.yellow;
      case 'color(0xffaafb00)':
        return FavoriteColor.limeGreen;
      case 'color(0xff00fb00)':
        return FavoriteColor.green;
      case 'color(0xff00a238)':
        return FavoriteColor.darkGreen;
      case 'color(0xff49db8a)':
        return FavoriteColor.emerald;
      case 'color(0xff30baf3)':
        return FavoriteColor.skyBlue;
      case 'color(0xff0059f3)':
        return FavoriteColor.blue;
      case 'color(0xff000092)':
        return FavoriteColor.darkBlue;
      case 'color(0xff8a00d3)':
        return FavoriteColor.purple;
      case 'color(0xffd300eb)':
        return FavoriteColor.lightPurple;
      case 'color(0xfffb0092)':
        return FavoriteColor.pink;

      default:
        return FavoriteColor.grey;
    }
  }
}
