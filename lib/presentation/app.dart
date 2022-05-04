import 'package:flutter/material.dart';
import 'package:horoskope/l10n/horoskope_localizations.dart';
import 'package:horoskope/presentation/pages/auth/auth_page.dart';
import 'package:horoskope/presentation/routes.dart';
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
            routes: appRoutes,
            supportedLocales: HoroskopeLocalizations.supportedLocales,
            localizationsDelegates:
                HoroskopeLocalizations.localizationsDelegates,
            onGenerateTitle: (context) => context.localizations.horoskope,
            theme: HoroskopeTheme.of(context).themeData,
            home: AuthPage.signIn(
              theme: HoroskopeTheme.of(context),
            ),
          );
        },
      ),
    );
  }
}
