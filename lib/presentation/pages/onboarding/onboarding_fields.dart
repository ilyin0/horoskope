part of 'onboarding_page.dart';

List<Widget> getNameAndBirthDataOnboardingFields(
  BuildContext context, {
  required OnboardingPageThemeData theme,
}) {
  final dateInputController = TextEditingController();

  return [
    HoroskopeNamedTextFormField(
      name: context.localizations.whatIsYourNameQuestion,
      textFormField: HoroskopeTextFormField(
        colorThemeData: theme.colorTheme,
        labelText: context.localizations.name,
        validator: Validators.name,
      ),
      textTheme: theme.textTheme,
    ),
    const SizedBox(height: 16),
    HoroskopeNamedTextFormField(
      textFormField: HoroskopeTextFormField(
        colorThemeData: theme.colorTheme,
        hintText: '15/10/2003',
        enabled: false,
        onTap: () async {
          final dateTime = await showHoroskopeDatePicker(
            context,
            initialDate: DateTime(2003, 10, 15),
            theme: HoroskopeTheme.of(context),
          );

          dateInputController.text = dateTime.toString();
        },
      ),
      name: context.localizations.whenWereYouBornQuestion,
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
      textTheme: theme.textTheme,
      textFormField: HoroskopeTextFormField(
        colorThemeData: theme.colorTheme,
        labelText: context.localizations.city,
      ),
    ),
    const SizedBox(height: 16),
    HoroskopeNamedTextFormField(
      name: context.localizations.theTimeYouWereBorn,
      textFormField: HoroskopeTextFormField(
        colorThemeData: theme.colorTheme,
        hintText: '12:00',
      ),
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
