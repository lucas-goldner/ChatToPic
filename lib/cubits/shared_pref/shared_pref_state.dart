import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:equatable/equatable.dart';

class SharedPrefState extends Equatable {
  const SharedPrefState({
    this.favoriteColor = FavoriteColor.grey,
    this.onboardingDone = false,
    this.username = "",
  });

  final FavoriteColor favoriteColor;
  final bool onboardingDone;
  final String username;

  SharedPrefState copyWith({
    FavoriteColor? favoriteColor,
    bool? onboardingDone,
    String? username,
  }) =>
      SharedPrefState(
        favoriteColor: favoriteColor ?? this.favoriteColor,
        onboardingDone: onboardingDone ?? this.onboardingDone,
        username: username ?? this.username,
      );

  @override
  List<Object?> get props => [favoriteColor, onboardingDone, username];
}
