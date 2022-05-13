import 'package:flutter/material.dart';
import 'package:horoskope/l10n/horoskope_localizations.dart';
import 'package:horoskope/presentation/pages/compatibility_details/compatibility_details_page.dart';
import 'package:horoskope/presentation/routes.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/light/light_theme.dart';
import 'package:horoskope/presentation/utils/extensions/build_context_ext.dart';

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
            initialRoute: Routes.home,
            supportedLocales: HoroskopeLocalizations.supportedLocales,
            localizationsDelegates:
                HoroskopeLocalizations.localizationsDelegates,
            onGenerateTitle: (context) => context.localizations.horoskope,
            onGenerateRoute: onGenerateRoute,
            theme: HoroskopeTheme.of(context).themeData,
          );
        },
      ),
    );
  }
}

Route onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments = settings.arguments;

  if (routeName == Routes.compatibilityDetails) {
    final args = arguments as CompatibilityDetailsPageArguments;
    return MaterialPageRoute(
      builder: (context) => CompatibilityDetailsPage(
        theme: HoroskopeTheme.of(context),
        compatibilityId: args.compatibilityId,
      ),
    );
  }

  return MaterialPageRoute(
    builder: (_) => Container(
      color: Colors.red,
    ),
  );
}
