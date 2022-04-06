part of '../horoskope_theme.dart';

class HoroskopeThemeData<
    T extends HoroskopeBaseTextThemeData,
    C extends HoroskopeBaseColorThemeData,
    B extends HoroskopeBaseButtonThemeData> {
  final ThemeData themeData;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.text(context)`
  final T textTheme;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.color(context)`
  final C colorTheme;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.button(context)`
  final B buttonTheme;

  const HoroskopeThemeData({
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
    required this.buttonTheme,
  });
}

typedef HoroskopeBaseThemeData = HoroskopeThemeData<HoroskopeBaseTextThemeData,
    HoroskopeBaseColorThemeData, HoroskopeBaseButtonThemeData>;
