import 'package:chattopic/model/enum/shared_pref_keys.dart';
import 'package:chattopic/providers/interfaces/shared_pref_provider_interface.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider implements SharedPrefProviderInterface {
  @visibleForTesting
  SharedPreferences? prefs;

  @override
  bool get initialized => prefs != null;

  @override
  Future<void> loadSharedPrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  @override
  String getSharedPref(SharedPrefKey sharedPrefKey) =>
      prefs?.get(sharedPrefKey.getKeyValue()).toString() ?? "";

  @override
  void setStringInSharedPrefs(SharedPrefKey sharedPrefKey, String value) =>
      prefs?.setString(sharedPrefKey.getKeyValue(), value);
}
