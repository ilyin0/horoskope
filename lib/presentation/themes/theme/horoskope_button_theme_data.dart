part of '../horoskope_theme.dart';

abstract class HoroskopeButtonThemeData
    implements
        HoroskopeBaseButtonThemeData,
        HomePageButtonThemeData,
        AuthPageButtonThemeData {
  HoroskopeButtonStyle get primary;
  HoroskopeButtonStyle get secondary1;
  HoroskopeButtonStyle get secondary2;
  HoroskopeButtonStyle get disabled;
}

abstract class HoroskopeBaseButtonThemeData {
  HoroskopeButtonStyle getPrimaryTab(bool isSelected);
  HoroskopeButtonStyle getPrimaryBigTab(bool isSelected);
  HoroskopeButtonStyle getSecondaryTab(bool isSelected);
  HoroskopeButtonStyle getSecondaryBigTab(bool isSelected);
}
