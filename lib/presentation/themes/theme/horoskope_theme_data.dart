part of '../horoskope_theme.dart';

class HoroskopeThemeData {
  final ThemeData themeData;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.text(context)`
  final HoroskopeTextThemeData textTheme;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.color(context)`
  final HoroskopeColorThemeData colorTheme;

  /// Should not be used directly.
  /// Please, use `HoroskopeTheme.button(context)`
  final HoroskopeButtonThemeData buttonTheme;

  const HoroskopeThemeData({
    required this.themeData,
    required this.textTheme,
    required this.colorTheme,
    required this.buttonTheme,
  });
}
