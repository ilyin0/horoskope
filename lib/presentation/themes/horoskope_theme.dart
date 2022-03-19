import 'package:flutter/material.dart';
import 'package:horoskope/presentation/widgets/info_card.dart';

part 'theme/horoskope_button_theme_data.dart';
part 'theme/horoskope_color_theme_data.dart';
part 'theme/horoskope_text_theme_data.dart';
part 'theme/horoskope_theme_data.dart';

class HoroskopeTheme extends InheritedWidget {
  static HoroskopeThemeData of(BuildContext context) => maybeOf(context)!;

  static HoroskopeThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HoroskopeTheme>()?.theme;
  }

  static HoroskopeTextThemeData text(BuildContext context) =>
      of(context).textTheme;
  static HoroskopeColorThemeData color(BuildContext context) =>
      of(context).colorTheme;
  static HoroskopeButtonThemeData button(BuildContext context) =>
      of(context).buttonTheme;

  final HoroskopeThemeData theme;

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
