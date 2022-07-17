enum SharedPrefKey { favColor }

extension SharedPrefKeysExtension on SharedPrefKey {
  String getKeyValue() {
    switch (this) {
      case SharedPrefKey.favColor:
        return "FAVORITE_COLOR";
      default:
        return "";
    }
  }
}
