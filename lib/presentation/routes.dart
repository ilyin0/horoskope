import 'package:flutter/material.dart';
import 'package:horoskope/presentation/pages/auth/auth_page.dart';
import 'package:horoskope/presentation/pages/home/home_page.dart';
import 'package:horoskope/presentation/pages/onboarding/onboarding_page.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';

abstract class Routes {
  static const signIn = 'signIn';
  static const signUp = 'signUp';
  static const home = 'home';
  static const birthDataInput = 'birthDataInput';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.signIn: (context) => AuthPage.signIn(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.signUp: (context) => AuthPage.signUp(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.home: (context) => HomePage(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.birthDataInput: (context) => OnboardingPage(
        theme: HoroskopeTheme.of(context),
      ),
};
