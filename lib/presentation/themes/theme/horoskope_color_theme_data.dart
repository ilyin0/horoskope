part of '../horoskope_theme.dart';

abstract class HoroskopeColorThemeData
    implements
        HomePageColorThemeData,
        AuthPageColorThemeData,
        OnboardingPageColorThemeData {}

abstract class HoroskopeBaseColorThemeData {
  Color get primary;
}
