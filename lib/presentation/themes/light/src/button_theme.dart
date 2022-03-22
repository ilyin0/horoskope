part of '../light_theme.dart';

class _LightHoroskopeButtonTheme implements HoroskopeButtonThemeData {
  const _LightHoroskopeButtonTheme();

  final double _baseBorderRadius = 12;

  HoroskopeButtonStyle get _base => HoroskopeButtonStyle(
        borderRadius: _baseBorderRadius,
        buttonStyle: TextButton.styleFrom(
          shadowColor: _AppColors.lightGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_baseBorderRadius),
          ),
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          enableFeedback: true,
        ),
      );

  HoroskopeButtonStyle get _baseWithPadding => _base.copyWith(
        buttonStyle: _base.buttonStyle.copyWith(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 36),
          ),
        ),
      );

  @override
  HoroskopeButtonStyle get primary => _baseWithPadding.copyWith(
        buttonStyle: _baseWithPadding.buttonStyle.copyWith(
          foregroundColor: MaterialStateProperty.all(_AppColors.white),
          backgroundColor: MaterialStateProperty.all(_AppColors.primaryBlue),
          overlayColor: MaterialStateProperty.all(_AppColors.white10),
        ),
      );

  @override
  HoroskopeButtonStyle get secondary1 => _baseWithPadding.copyWith(
        buttonStyle: _baseWithPadding.buttonStyle.copyWith(
          foregroundColor: MaterialStateProperty.all(_AppColors.primaryBlue),
          backgroundColor: MaterialStateProperty.all(_AppColors.secondaryGrey),
          overlayColor: MaterialStateProperty.all(_AppColors.primaryBlue10),
        ),
      );

  @override
  HoroskopeButtonStyle get secondary2 => _baseWithPadding.copyWith(
        buttonStyle: _baseWithPadding.buttonStyle.copyWith(
          foregroundColor: MaterialStateProperty.all(_AppColors.brinkPink),
          backgroundColor: MaterialStateProperty.all(_AppColors.isabelline),
          overlayColor: MaterialStateProperty.all(_AppColors.brinkPink10),
        ),
      );

  @override
  HoroskopeButtonStyle get disabled => _baseWithPadding.copyWith(
        buttonStyle: _baseWithPadding.buttonStyle.copyWith(
          foregroundColor: MaterialStateProperty.all(_AppColors.lightGrey),
          backgroundColor: MaterialStateProperty.all(_AppColors.whiteUltra),
          overlayColor: MaterialStateProperty.all(_AppColors.lightGrey10),
          shadowColor: MaterialStateProperty.all(_AppColors.transparent),
        ),
      );
}
