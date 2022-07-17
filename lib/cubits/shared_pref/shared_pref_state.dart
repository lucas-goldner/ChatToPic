import 'package:chattopic/model/enum/favorite_color.dart';

abstract class SharedPrefState {
  final FavoriteColor favoriteColor;

  const SharedPrefState(this.favoriteColor);
}

class SharedPrefInitial extends SharedPrefState {
  const SharedPrefInitial() : super(FavoriteColor.grey);
}

class SharedPrefLoaded extends SharedPrefState {
  const SharedPrefLoaded([
    FavoriteColor favoriteColor = FavoriteColor.grey,
  ]) : super(favoriteColor);
}
