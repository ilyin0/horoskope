part of '../horoskope_theme.dart';

abstract class HoroskopeColorThemeData
    implements
        HomePageColorThemeData,
        AuthPageColorThemeData,
        OnboardingPageColorThemeData,
        AboutYouFragmentColorThemeData,
        CompatibilityDetailsPageColorThemeData {}

abstract class HoroskopeBaseColorThemeData {
  Color get primary;
}
