import 'package:flutter/material.dart';
import 'package:horoskope/presentation/pages/add_friend/add_friend_page.dart';
import 'package:horoskope/presentation/pages/auth/auth_page.dart';
import 'package:horoskope/presentation/pages/home/home_page.dart';
import 'package:horoskope/presentation/pages/onboarding/onboarding_page.dart';
import 'package:horoskope/presentation/pages/splash_screen.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';

abstract class Routes {
  static const splash = 'splash';
  static const signIn = 'signIn';
  static const signUp = 'signUp';
  static const home = 'home';
  static const onboarding = 'onboarding';
  static const compatibilityDetails = 'compatibilityDetails';
  static const addFriend = 'addFriend';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.splash: (_) => const SplashScreen(),
  Routes.signIn: (context) => AuthPage.signIn(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.signUp: (context) => AuthPage.signUp(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.home: (context) => HomePage(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.onboarding: (context) => OnboardingPage(
        theme: HoroskopeTheme.of(context),
      ),
  Routes.addFriend: (context) => AddFriendPage(
        theme: HoroskopeTheme.of(context),
      ),
};
