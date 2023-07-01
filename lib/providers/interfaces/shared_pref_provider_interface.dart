import 'package:chattopic/model/enum/shared_pref_key.dart';

abstract class SharedPrefProviderInterface {
  Future<void> loadSharedPrefs();
  Future<void> setStringInSharedPrefs(
    SharedPrefKey sharedPrefKey,
    String value,
  );
  String? getStringSharedPref(SharedPrefKey sharedPrefKey);
  Future<void> setBoolInSharedPrefs(
    SharedPrefKey sharedPrefKey,
    bool value,
  );
  bool? getBoolSharedPref(SharedPrefKey sharedPrefKey);
}
