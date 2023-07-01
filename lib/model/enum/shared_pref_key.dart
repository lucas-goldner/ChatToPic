enum SharedPrefKey {
  favColor("FAVORITE_COLOR"),
  username("USERNAME"),
  onboardingDone("ONBOARDING_DONE");

  const SharedPrefKey(this.key);

  final String key;
}
