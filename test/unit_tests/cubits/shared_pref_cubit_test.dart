import 'package:bloc_test/bloc_test.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mock_provider/sharedpref_provider_mock.dart';

void main() {
  late SharedPrefProvider sharedPrefProvider;
  late SharedPrefCubit sharedPrefCubit;

  setUp(() {
    sharedPrefProvider = MockSharedPrefProvider();
    sharedPrefCubit = SharedPrefCubit(sharedPrefProvider);
    when(() => sharedPrefProvider.loadSharedPrefs())
        .thenAnswer((_) => Future.value());
  });

  group('Test SharedPrefCubit', () {
    group('Test loadSharedPrefs', () {
      blocTest<SharedPrefCubit, SharedPrefState>(
        'test loadSharedPrefs with no data present',
        build: () => sharedPrefCubit,
        act: (cubit) => cubit.loadSharedPrefs(),
        expect: () => [
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: "",
          ),
        ],
      );

      blocTest<SharedPrefCubit, SharedPrefState>(
        'test loadSharedPrefs with data present',
        build: () {
          when(() => sharedPrefProvider.getBoolSharedPref(
              SharedPrefKey.onboardingDone)).thenAnswer((_) => true);
          when(() => sharedPrefProvider.getStringSharedPref(
              SharedPrefKey.username)).thenAnswer((_) => "LucasG");
          when(() => sharedPrefProvider.getStringSharedPref(
              SharedPrefKey.favColor)).thenAnswer((_) => "Color(0xff8a00d3)");
          return sharedPrefCubit;
        },
        act: (cubit) => cubit.loadSharedPrefs(),
        expect: () => [
          const SharedPrefState(
            favoriteColor: FavoriteColor.purple,
            onboardingDone: true,
            username: "LucasG",
          ),
        ],
      );
    });

    group('Test setOnboardingDone', () {
      blocTest<SharedPrefCubit, SharedPrefState>(
        'test setOnboardingDone to true',
        build: () {
          when(() => sharedPrefProvider.setBoolInSharedPrefs(
                  SharedPrefKey.onboardingDone, true))
              .thenAnswer((_) => Future.value());
          return sharedPrefCubit;
        },
        act: (cubit) => cubit
          ..loadSharedPrefs()
          ..setOnboardingDone(true),
        expect: () => [
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: "",
          ),
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: true,
            username: "",
          ),
        ],
      );
    });

    group('Test setFavoriteColor', () {
      blocTest<SharedPrefCubit, SharedPrefState>(
        'test setFavoriteColor to blue',
        build: () {
          when(() => sharedPrefProvider.setStringInSharedPrefs(
                  SharedPrefKey.favColor, FavoriteColor.blue.color.toString()))
              .thenAnswer((_) => Future.value());
          return sharedPrefCubit;
        },
        act: (cubit) => cubit
          ..loadSharedPrefs()
          ..setFavoriteColor(FavoriteColor.blue),
        expect: () => [
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: "",
          ),
          const SharedPrefState(
            favoriteColor: FavoriteColor.blue,
            onboardingDone: false,
            username: "",
          ),
        ],
      );
    });

    group('Test setUsername', () {
      blocTest<SharedPrefCubit, SharedPrefState>(
        'test setUsername to LucasG',
        build: () {
          when(() => sharedPrefProvider.setStringInSharedPrefs(
                  SharedPrefKey.username, "LucasG"))
              .thenAnswer((_) => Future.value());
          return sharedPrefCubit;
        },
        act: (cubit) => cubit
          ..loadSharedPrefs()
          ..setUsername("LucasG"),
        expect: () => [
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: "",
          ),
          const SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: "LucasG",
          ),
        ],
      );
    });
  });
}
