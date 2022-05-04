part of '../light_theme.dart';

final _themeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: _AppColors.primaryBlue,
  fontFamily: 'Lato',
  inputDecorationTheme: _inputDecorationTheme,
);

final InputBorder _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
);

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: _inputBorder,
  focusedBorder: _inputBorder.copyWith(
    borderSide: const BorderSide(color: _AppColors.primaryBlue),
  ),
  errorBorder: _inputBorder.copyWith(
    borderSide: const BorderSide(color: _AppColors.red),
  ),
  hintStyle: _textFieldHint,
  filled: true,
  fillColor: _AppColors.white,
  labelStyle: _textFieldLabel,
  floatingLabelStyle: _textFieldFloatingLabel,
  enabledBorder: _inputBorder.copyWith(
    borderSide: const BorderSide(color: _AppColors.lightGrey),
  ),
);
