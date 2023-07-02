import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/interfaces/shared_pref_provider_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider implements SharedPrefProviderInterface {
  @visibleForTesting
  SharedPreferences? prefs;

  @override
  Future<void> loadSharedPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  @override
  String? getStringSharedPref(SharedPrefKey sharedPrefKey) =>
      prefs?.getString(sharedPrefKey.key) ?? "";

  @override
  bool? getBoolSharedPref(SharedPrefKey sharedPrefKey) =>
      prefs?.getBool(sharedPrefKey.key) ?? false;

  @override
  Future<void> setStringInSharedPrefs(
    SharedPrefKey sharedPrefKey,
    String value,
  ) async =>
      await prefs?.setString(sharedPrefKey.key, value);

  @override
  Future<void> setBoolInSharedPrefs(
    SharedPrefKey sharedPrefKey,
    bool value,
  ) async =>
      await prefs?.setBool(sharedPrefKey.key, value);
}
