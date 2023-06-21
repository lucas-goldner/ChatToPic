import 'package:chattopic/model/enum/favorite_color.dart';

abstract class SharedPrefState {
  final FavoriteColor favoriteColor;
  final bool onboardingDone;

  const SharedPrefState(this.favoriteColor, this.onboardingDone);
}

class SharedPrefInitial extends SharedPrefState {
  const SharedPrefInitial() : super(FavoriteColor.grey, false);
}

class SharedPrefLoaded extends SharedPrefState {
  const SharedPrefLoaded([
    FavoriteColor favoriteColor = FavoriteColor.grey,
    bool onboardingDone = false,
  ]) : super(favoriteColor, onboardingDone);
}
