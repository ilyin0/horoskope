part of 'home_page.dart';

abstract class HomePageColorThemeData
    implements HoroskopeFragmentColorThemeData, HoroskopeBaseColorThemeData {
  Color get compatibilityFragmentMainColor;
  Color get aboutYouFragmentMainColor;
  Color get bottomNavigationBarBackgroundColor;
}

abstract class HomePageTextThemeData implements InfoCardTextThemeData {
  TextStyle get horoskopeFragmentTitle;
  TextStyle get compatibilityFragmentTitle;
  TextStyle get aboutYouFragmentTitle;
}

abstract class HomePageButtonThemeData
    implements HoroskopeFragmentButtonThemeData {}

typedef HomePageThemeData = HoroskopeThemeData<HomePageTextThemeData,
    HomePageColorThemeData, HomePageButtonThemeData>;
