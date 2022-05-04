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

  HoroskopeButtonStyle get _tab => _base.copyWith(
        borderRadius: 20,
        buttonStyle: _base.buttonStyle.copyWith(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
          ),
          overlayColor: MaterialStateProperty.all(_AppColors.transparent),
          enableFeedback: false,
        ),
      );

  @override
  HoroskopeButtonStyle getPrimaryTab(bool isSelected) {
    return _tab.copyWith(
      buttonStyle: _tab.buttonStyle.copyWith(
        foregroundColor: MaterialStateProperty.all(
          isSelected ? _AppColors.white : _AppColors.darkElectricBlue,
        ),
        backgroundColor: MaterialStateProperty.all(
          isSelected ? _AppColors.primaryBlue : _AppColors.white,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  HoroskopeButtonStyle getPrimaryBigTab(bool isSelected) {
    return getPrimaryTab(isSelected).copyWith(
      borderRadius: 40,
      buttonStyle: getPrimaryTab(isSelected).buttonStyle.copyWith(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            ),
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
    );
  }

  @override
  HoroskopeButtonStyle getSecondaryTab(bool isSelected) {
    return getPrimaryTab(isSelected).copyWith(
      buttonStyle: getPrimaryTab(isSelected).buttonStyle.copyWith(
            foregroundColor: MaterialStateProperty.all(
              isSelected ? _AppColors.isabelline : _AppColors.darkElectricBlue,
            ),
            backgroundColor: MaterialStateProperty.all(
              isSelected ? _AppColors.brinkPink : _AppColors.white,
            ),
          ),
    );
  }

  @override
  HoroskopeButtonStyle getSecondaryBigTab(bool isSelected) {
    return getPrimaryBigTab(isSelected).copyWith(
      buttonStyle: getPrimaryBigTab(isSelected).buttonStyle.copyWith(
            foregroundColor: MaterialStateProperty.all(
              isSelected ? _AppColors.isabelline : _AppColors.darkElectricBlue,
            ),
            backgroundColor: MaterialStateProperty.all(
              isSelected ? _AppColors.brinkPink : _AppColors.white,
            ),
          ),
    );
  }

  @override
  HoroskopeButtonStyle tabNameStyle(bool isSelected) =>
      getPrimaryTab(isSelected);

  @override
  HoroskopeButtonStyle get signIn => primary;

  @override
  HoroskopeButtonStyle get socialSignIn => HoroskopeButtonStyle(
        buttonStyle: TextButton.styleFrom(
          shape: const CircleBorder(
            side: BorderSide(
              width: 1,
              color: _AppColors.secondaryGrey,
            ),
          ),
          backgroundColor: _AppColors.white,
        ),
      );
}
