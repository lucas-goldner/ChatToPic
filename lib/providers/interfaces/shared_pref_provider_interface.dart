import 'package:chattopic/model/enum/shared_pref_key.dart';

abstract class SharedPrefProviderInterface {
  bool get initialized;
  Future<void> loadSharedPrefs();
  void setStringInSharedPrefs(SharedPrefKey sharedPrefKey, String value);
  String getSharedPref(SharedPrefKey sharedPrefKey);
}
