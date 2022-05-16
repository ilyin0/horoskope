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

  @override
  TextStyle get compatibilityCircleAvatarText => _circleAvatar;

  @override
  TextStyle get compatibilityShortCardRate => _subtitle1;

  @override
  TextStyle get compatibilityShortCardSubtitle => _bodyText2;

  @override
  TextStyle get compatibilityShortCardTitle => _subtitle1;

  @override
  TextStyle get chartsTitle => _title2;

  @override
  TextStyle get compatibilityDetailsPersonName => _title2;

  @override
  TextStyle get compatibilityDetailsRate => _subtitle1;

  @override
  TextStyle get welcomeCompatibilityCardBody => _bodyText2;

  @override
  TextStyle get welcomeCompatibilityCardTitle => _title3;

  @override
  TextStyle get compatibilityDetailsCardBody => _bodyText2;

  @override
  TextStyle get compatibilityDetailsCardTitle => _title2;

  @override
  TextStyle get aboutYouCardBody => _bodyText2;

  @override
  TextStyle get aboutYouCardTitle => _title3;

  @override
  TextStyle get forecastBody => _bodyText2;
}
