part of '../horoskope_theme.dart';

abstract class HoroskopeColorThemeData
    implements
        HomePageColorThemeData,
        AuthPageColorThemeData,
        OnboardingPageColorThemeData,
        AboutYouFragmentColorThemeData,
        CompatibilityDetailsPageColorThemeData,
        AddFriendPageColorThemeData {}

abstract class HoroskopeBaseColorThemeData {
  Color get primary;

  LinearGradient get aboutYouFragmentShimmerGradient;
}
