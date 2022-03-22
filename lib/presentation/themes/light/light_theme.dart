import 'package:flutter/material.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';

part 'src/button_theme.dart';
part 'src/color_theme.dart';
part 'src/constants.dart';
part 'src/text_theme.dart';
part 'src/theme_data.dart';

class LightHoroskopeThemeData extends HoroskopeThemeData {
  LightHoroskopeThemeData()
      : super(
          themeData: _themeData,
          textTheme: const _LightHoroskopeTextTheme(),
          colorTheme: const _LightHoroskopeColorTheme(),
          buttonTheme: const _LightHoroskopeButtonTheme(),
        );
}
