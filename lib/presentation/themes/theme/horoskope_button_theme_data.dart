part of '../horoskope_theme.dart';

abstract class HoroskopeButtonThemeData
    implements HoroskopeBaseButtonThemeData {
  HoroskopeButtonStyle get primary;
  HoroskopeButtonStyle get secondary1;
  HoroskopeButtonStyle get secondary2;
  HoroskopeButtonStyle get disabled;

  HoroskopeButtonStyle getPrimaryTab(bool isSelected);
  HoroskopeButtonStyle getPrimaryBigTab(bool isSelected);
  HoroskopeButtonStyle getSecondaryTab(bool isSelected);
  HoroskopeButtonStyle getSecondaryBigTab(bool isSelected);
}

abstract class HoroskopeBaseButtonThemeData {}
