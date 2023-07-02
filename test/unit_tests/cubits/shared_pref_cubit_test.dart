import 'package:bloc_test/bloc_test.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/data/mock_shared_pref_data.dart';
import '../../mocks/provider/sharedpref_provider_mock.dart';

void main() {
  late SharedPrefProvider sharedPrefProvider;
  late SharedPrefCubit sharedPrefCubit;
  late MockSharedPrefData mockSharedPrefData;

  setUp(() {
    mockSharedPrefData = MockSharedPrefData();
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
          when(() => sharedPrefProvider
                  .getStringSharedPref(SharedPrefKey.username))
              .thenAnswer((_) => mockSharedPrefData.getBasicData().username);
          when(() => sharedPrefProvider
                  .getStringSharedPref(SharedPrefKey.favColor))
              .thenAnswer(
                  (_) => mockSharedPrefData.getBasicData().favoriteColor);
          return sharedPrefCubit;
        },
        act: (cubit) => cubit.loadSharedPrefs(),
        expect: () => [
          SharedPrefState(
            favoriteColor: FavoriteColor.purple,
            onboardingDone: true,
            username: mockSharedPrefData.getBasicData().username,
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
                  SharedPrefKey.username,
                  mockSharedPrefData.getBasicData().username))
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
          SharedPrefState(
            favoriteColor: FavoriteColor.grey,
            onboardingDone: false,
            username: mockSharedPrefData.getBasicData().username,
          ),
        ],
      );
    });
  });
}
