part of '../light_theme.dart';

class _LightHoroskopeTextTheme implements HoroskopeTextThemeData {
  const _LightHoroskopeTextTheme();

  @override
  TextStyle get horoskopeFragmentTitle => _title1.copyWith(
        color: _AppColors.primaryBlue,
      );

  @override
  TextStyle get compatibilityFragmentTitle => _title1.copyWith(
        color: _AppColors.brinkPink,
      );

  @override
  TextStyle get aboutYouFragmentTitle => _title1.copyWith(
        color: _AppColors.lightCoral,
      );

  @override
  TextStyle get infoCardBody => _bodyText2;

  @override
  TextStyle get infoCardTitle => _title3;

  @override
  TextStyle get infoCardBigTitle => _title2;

  @override
  TextStyle get logoTitle => _title1.copyWith(
        color: _AppColors.primaryBlue,
      );

  @override
  TextStyle get textAndActionActionStyle => _bodyText2.copyWith(
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get textAndActionTextStyle => _bodyText2;

  @override
  TextStyle get formFieldName => _subtitle1;
}
