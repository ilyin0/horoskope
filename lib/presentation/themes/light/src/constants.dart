part of '../light_theme.dart';

const _title1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 36,
);
const _title2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 24,
);
const _title3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const _subtitle1 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
const _bodyText2 = TextStyle(fontSize: 16);
const _textFieldLabel = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: _AppColors.lightGrey,
);
const _textFieldFloatingLabel = TextStyle(
  fontSize: 14,
  color: _AppColors.darkElectricBlue,
);
const _circleAvatar = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: _AppColors.white,
);

abstract class _AppColors {
  static const primaryBlue = Color(0xFF3379AF);
  static const primaryBlue10 = Color(0x1A3379AF);
  static const secondaryGrey = Color(0xFFE9EDF0);
  static const lightGrey = Color(0xFFBCC8D1);
  static const lightGrey10 = Color(0x1ABCC8D1);
  static const white = Colors.white;
  static const red = Colors.red;
  static const white10 = Colors.white10;
  static const brinkPink = Color(0xFFEE4469);
  static const brinkPink10 = Color(0x1AEE4469);
  static const lightCoral = Color(0xFFF28482);
  static const isabelline = Color(0xFFF7F4F3);
  static const whiteUltra = Color(0xFFFCFBFA);
  static const transparent = Colors.transparent;
  static const darkElectricBlue = Color(0xFF546A7B);
}
