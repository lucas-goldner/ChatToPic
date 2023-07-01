import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  final SharedPrefProvider _sharedPrefProvider;

  SharedPrefCubit(this._sharedPrefProvider) : super(const SharedPrefInitial());

  Future<void> loadSharedPrefs() async {
    await _sharedPrefProvider.loadSharedPrefs();
    print(_sharedPrefProvider.getBoolSharedPref(SharedPrefKey.onboardingDone));
    print(_sharedPrefProvider.getStringSharedPref(SharedPrefKey.username));
    print(_sharedPrefProvider.getStringSharedPref(SharedPrefKey.favColor));

    emit(SharedPrefLoaded(
      onboardingDone:
          _sharedPrefProvider.getBoolSharedPref(SharedPrefKey.onboardingDone),
      username: _sharedPrefProvider.getStringSharedPref(SharedPrefKey.username),
      // favoriteColor:
      //     _sharedPrefProvider.getStringSharedPref(SharedPrefKey.favColor),
    ));
  }

  Future<void> setOnboardingDone(bool onboardingDone) async {
    await _sharedPrefProvider.setBoolInSharedPrefs(
      SharedPrefKey.onboardingDone,
      onboardingDone,
    );

    emit(state.copyWith(onboardingDone: onboardingDone));
  }

  Future<void> setFavoriteColor(FavoriteColor favColor) async {
    await _sharedPrefProvider.setStringInSharedPrefs(
      SharedPrefKey.favColor,
      favColor.color.toString(),
    );

    emit(state.copyWith(favoriteColor: favColor));
  }

  Future<void> setUsername(String username) async {
    await _sharedPrefProvider.setStringInSharedPrefs(
      SharedPrefKey.username,
      username,
    );

    emit(state.copyWith(username: username));
  }
}
