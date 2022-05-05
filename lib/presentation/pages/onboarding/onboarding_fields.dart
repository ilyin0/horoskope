part of 'onboarding_page.dart';

List<Widget> getNameAndBirthDataOnboardingFields(
  BuildContext context, {
  required OnboardingPageThemeData theme,
}) {
  return [
    HoroskopeNamedTextFormField(
      name: context.localizations.whatIsYourNameQuestion,
      labelText: context.localizations.name,
      textTheme: theme.textTheme,
      colorTheme: theme.colorTheme,
    ),
    const SizedBox(height: 16),
    HoroskopeNamedTextFormField(
      name: context.localizations.whenWereYouBornQuestion,
      colorTheme: theme.colorTheme,
      textTheme: theme.textTheme,
    ),
  ];
}

List<Widget> getBirthPlaceAndTimeDataOnboardingFields(
  BuildContext context, {
  required OnboardingPageThemeData theme,
}) {
  return [
    HoroskopeNamedTextFormField(
      name: context.localizations.whereWereYouBornQuestion,
      labelText: context.localizations.city,
      textTheme: theme.textTheme,
      colorTheme: theme.colorTheme,
    ),
    const SizedBox(height: 16),
    HoroskopeNamedTextFormField(
      name: context.localizations.theTimeYouWereBorn,
      colorTheme: theme.colorTheme,
      textTheme: theme.textTheme,
    ),
  ];
}

List<List<Widget> Function(BuildContext)> _getOnboardingViews({
  required OnboardingPageThemeData theme,
}) {
  return [
    (context) => getNameAndBirthDataOnboardingFields(context, theme: theme),
    (context) =>
        getBirthPlaceAndTimeDataOnboardingFields(context, theme: theme),
  ];
}
