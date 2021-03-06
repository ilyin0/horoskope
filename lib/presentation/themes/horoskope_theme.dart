import 'package:flutter/material.dart';
import 'package:horoskope/presentation/pages/add_friend/add_friend_page.dart';
import 'package:horoskope/presentation/pages/auth/auth_page.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_page.dart';
import 'package:horoskope/presentation/pages/home/fragments/about_you/about_you_frament.dart';
import 'package:horoskope/presentation/pages/home/fragments/horoskope/horoskope_fragment.dart';
import 'package:horoskope/presentation/pages/home/home_page.dart';
import 'package:horoskope/presentation/pages/onboarding/onboarding_page.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';

part 'theme/horoskope_button_theme_data.dart';
part 'theme/horoskope_color_theme_data.dart';
part 'theme/horoskope_text_theme_data.dart';
part 'theme/horoskope_theme_data.dart';

class HoroskopeTheme extends InheritedWidget {
  static HoroskopeThemeData<HoroskopeTextThemeData, HoroskopeColorThemeData,
      HoroskopeButtonThemeData> of(BuildContext context) => maybeOf(context)!;

  static HoroskopeThemeData<HoroskopeTextThemeData, HoroskopeColorThemeData,
      HoroskopeButtonThemeData>? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HoroskopeTheme>()?.theme;
  }

  static HoroskopeTextThemeData text(BuildContext context) =>
      of(context).textTheme;
  static HoroskopeColorThemeData color(BuildContext context) =>
      of(context).colorTheme;
  static HoroskopeButtonThemeData button(BuildContext context) =>
      of(context).buttonTheme;

  final HoroskopeThemeData<HoroskopeTextThemeData, HoroskopeColorThemeData,
      HoroskopeButtonThemeData> theme;

  const HoroskopeTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(HoroskopeTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}
