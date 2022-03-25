part of '../light_theme.dart';

class _LightHoroskopeTextTheme implements HoroskopeTextThemeData {
  const _LightHoroskopeTextTheme();

  @override
  TextStyle get homePageTitle => _title1.copyWith(
        color: _AppColors.primaryBlue,
      );

  @override
  TextStyle get infoCardBody => _bodyText2;

  @override
  TextStyle get infoCardTitle => _title3;

  @override
  TextStyle get infoCardBigTitle => _title2;
}
