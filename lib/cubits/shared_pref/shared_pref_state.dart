import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:equatable/equatable.dart';

class SharedPrefState extends Equatable {
  const SharedPrefState({
    required this.favoriteColor,
    required this.onboardingDone,
    required this.username,
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

class SharedPrefInitial extends SharedPrefState {
  const SharedPrefInitial()
      : super(
          favoriteColor: FavoriteColor.grey,
          onboardingDone: false,
          username: "",
        );
}

class SharedPrefLoaded extends SharedPrefState {
  const SharedPrefLoaded({
    FavoriteColor? favoriteColor,
    bool? onboardingDone,
    String? username,
  }) : super(
          favoriteColor: favoriteColor ?? FavoriteColor.grey,
          onboardingDone: onboardingDone ?? false,
          username: username ?? "",
        );
}
