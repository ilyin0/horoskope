import 'package:flutter/material.dart';
import 'package:horoskope/l10n/horoskope_localizations.dart';
import 'package:horoskope/presentation/pages/home/home_page.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/light/light_theme.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoroskopeTheme(
      theme: LightHoroskopeThemeData(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            supportedLocales: HoroskopeLocalizations.supportedLocales,
            localizationsDelegates:
                HoroskopeLocalizations.localizationsDelegates,
            onGenerateTitle: (context) => context.localizations.horoskope,
            theme: HoroskopeTheme.of(context).themeData,
            home: HomePage(
              theme: HoroskopeTheme.of(context),
            ),
          );
        },
      ),
    );
  }
}
