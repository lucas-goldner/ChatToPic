import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mocks/data/mock_shared_pref_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late SharedPrefProvider sharedPrefProvider;
  late MockSharedPrefData mockSharedPrefData;

  setUp(() {
    mockSharedPrefData = MockSharedPrefData();
    sharedPrefProvider = SharedPrefProvider();
  });

  group("Test SharedPrefProvider", () {
    group("Test loadSharedPrefs", () {
      test("test loadSharedPrefs empty values", () async {
        final Map<String, Object> values = <String, Object>{};
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.favColor.key),
          null,
        );
        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.username.key),
          null,
        );
        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.onboardingDone.key),
          null,
        );
      });
    });

    group("Test getStringSharedPref", () {
      test("test getStringSharedPref empty values", () async {
        final Map<String, Object> values = <String, Object>{};
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.favColor.key),
          null,
        );
      });

      test("test getStringSharedPref with value", () async {
        final data = mockSharedPrefData.getBasicData();
        final Map<String, Object> values = <String, Object>{
          SharedPrefKey.favColor.key: data.favoriteColor,
        };
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.favColor.key),
          data.favoriteColor,
        );
      });
    });

    group("Test setStringInSharedPrefs", () {
      test("test setStringInSharedPrefs empty string to new string", () async {
        final Map<String, Object> values = <String, Object>{};
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        await sharedPrefProvider.setStringInSharedPrefs(
          SharedPrefKey.favColor,
          mockSharedPrefData.getBasicData().favoriteColor,
        );

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.favColor.key),
          mockSharedPrefData.getBasicData().favoriteColor,
        );
      });

      test("test setStringInSharedPrefs old string to new string", () async {
        final data = mockSharedPrefData.getBasicData();
        final Map<String, Object> values = <String, Object>{
          SharedPrefKey.favColor.key: data.favoriteColor,
          SharedPrefKey.username.key: data.username,
          SharedPrefKey.onboardingDone.key: data.onboardingDone,
        };
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.username.key),
          mockSharedPrefData.getBasicData().username,
        );

        await sharedPrefProvider.setStringInSharedPrefs(
          SharedPrefKey.username,
          "LucasG2",
        );

        expect(
          sharedPrefProvider.prefs?.getString(SharedPrefKey.username.key),
          "LucasG2",
        );
      });
    });

    group("Test getBoolSharedPref", () {
      test("test getBoolSharedPref empty values", () async {
        final Map<String, Object> values = <String, Object>{};
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getBool(SharedPrefKey.onboardingDone.key),
          null,
        );
      });

      test("test getBoolSharedPref with value", () async {
        final data = mockSharedPrefData.getBasicData();
        final Map<String, Object> values = <String, Object>{
          SharedPrefKey.onboardingDone.key: data.onboardingDone,
        };
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getBool(SharedPrefKey.onboardingDone.key),
          data.onboardingDone,
        );
      });
    });

    group("Test setBoolInSharedPrefs", () {
      test("test setBoolInSharedPrefs empty bool to new bool", () async {
        final Map<String, Object> values = <String, Object>{};
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        await sharedPrefProvider.setBoolInSharedPrefs(
          SharedPrefKey.onboardingDone,
          mockSharedPrefData.getBasicData().onboardingDone,
        );

        expect(
          sharedPrefProvider.prefs?.getBool(SharedPrefKey.onboardingDone.key),
          mockSharedPrefData.getBasicData().onboardingDone,
        );
      });

      test("test setBoolInSharedPrefs old bool to new bool", () async {
        final data = mockSharedPrefData.getBasicData();
        final Map<String, Object> values = <String, Object>{
          SharedPrefKey.favColor.key: data.favoriteColor,
          SharedPrefKey.username.key: data.username,
          SharedPrefKey.onboardingDone.key: data.onboardingDone,
        };
        SharedPreferences.setMockInitialValues(values);
        await sharedPrefProvider.loadSharedPrefs();

        expect(
          sharedPrefProvider.prefs?.getBool(SharedPrefKey.onboardingDone.key),
          mockSharedPrefData.getBasicData().onboardingDone,
        );

        await sharedPrefProvider.setBoolInSharedPrefs(
          SharedPrefKey.onboardingDone,
          false,
        );

        expect(
          sharedPrefProvider.prefs?.getBool(SharedPrefKey.onboardingDone.key),
          false,
        );
      });
    });
  });
}
