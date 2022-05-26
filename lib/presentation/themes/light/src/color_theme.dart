part of '../light_theme.dart';

class _LightHoroskopeColorTheme implements HoroskopeColorThemeData {
  const _LightHoroskopeColorTheme();

  @override
  Color get primary => _AppColors.primaryBlue;

  @override
  Color get horoskopeFragmentMainColor => _AppColors.primaryBlue;

  @override
  Color get horoskopeFragmentCardColor => _AppColors.white;

  @override
  Color get compatibilityFragmentMainColor => _AppColors.brinkPink;

  @override
  Color get aboutYouFragmentMainColor => _AppColors.lightCoral;

  @override
  Color get bottomNavigationBarBackgroundColor => _AppColors.white;

  @override
  Color get dividerColor => _AppColors.lightGrey;

  @override
  Color get cursorColor => _AppColors.primaryBlue;

  @override
  Color get cupertinoDatePickerBackground => _AppColors.white;

  @override
  Color get compatibilityCircleAvatarBackgroundColor => _AppColors.white;

  @override
  Color get compatibilityCircleAvatarBorderColor => _AppColors.isabelline;

  @override
  Color get compatibilityCircleAvatarColor => _AppColors.brinkPink;

  @override
  Color get aboutYouChartCardBackground => _AppColors.isabelline;

  @override
  Color get aboutYouChartCardShadow => _AppColors.lightCoral;

  @override
  Color get aboutYouEmptyChartCardBackground => _AppColors.white;

  @override
  Color get aboutYouEmptyChartCardShadow => _AppColors.lightGrey;

  @override
  Color get aboutYouLoadingChartCardBackground => _AppColors.whiteUltra;

  @override
  Color get aboutYouLoadingChartCardShadow => _AppColors.lightGrey;

  @override
  Color get background => _AppColors.white;

  @override
  Color get friendshipCard => _AppColors.isabelline;

  @override
  Color get friendshipCardShadow => _AppColors.primaryBlue;

  @override
  Color get friendshipCompatibility => _AppColors.primaryBlue;

  @override
  Color get romanticCard => _AppColors.isabelline;

  @override
  Color get romanticCardShadow => _AppColors.brinkPink;

  @override
  Color get romanticCompatibility => _AppColors.brinkPink;

  @override
  Color get welcomeCompatibilityCard => _AppColors.white;

  @override
  Color get welcomeCompatibilityCardShadow => _AppColors.lightGrey;

  @override
  Color get compatibilityLoadingChartCardBackground => _AppColors.whiteUltra;

  @override
  Color get compatibilityLoadingChartCardShadow => _AppColors.lightGrey;

  @override
  LinearGradient get aboutYouFragmentShimmerGradient => const LinearGradient(
        colors: [
          _AppColors.isabelline,
          _AppColors.whiteUltra,
          _AppColors.isabelline,
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      );

  @override
  LinearGradient get horoskopeFragmentShimmerGradient => const LinearGradient(
        colors: [
          _AppColors.whiteUltra,
          _AppColors.white,
          _AppColors.whiteUltra,
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      );

  @override
  LinearGradient get compatibilityFragmentShimmerGradient =>
      const LinearGradient(
        colors: [
          _AppColors.whiteUltra,
          _AppColors.white,
          _AppColors.whiteUltra,
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      );

  @override
  LinearGradient get compatibilityDetailsShimmerGradient =>
      const LinearGradient(
        colors: [
          _AppColors.whiteUltra,
          _AppColors.white,
          _AppColors.whiteUltra,
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      );
}
