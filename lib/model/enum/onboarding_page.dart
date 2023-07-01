enum OnboardingPage {
  welcome(0),
  name(1),
  color(2);

  const OnboardingPage(this.pageIndex);
  final int pageIndex;
}
