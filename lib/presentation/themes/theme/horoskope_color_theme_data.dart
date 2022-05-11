part of '../horoskope_theme.dart';

abstract class HoroskopeColorThemeData
    implements
        HomePageColorThemeData,
        AuthPageColorThemeData,
        OnboardingPageColorThemeData,
        AboutYouFragmentColorThemeData {}

abstract class HoroskopeBaseColorThemeData {
  Color get primary;
}
