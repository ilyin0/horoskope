import 'package:flutter/material.dart';

class HoroskopeButtonStyle {
  final double? borderRadius;
  final ButtonStyle _buttonStyle;

  const HoroskopeButtonStyle({
    this.borderRadius,
    required ButtonStyle buttonStyle,
  }) : _buttonStyle = buttonStyle;

  ButtonStyle get buttonStyle {
    final borderRadius = this.borderRadius;

    return borderRadius == null
        ? _buttonStyle
        : _buttonStyle.copyWith(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          );
  }

  HoroskopeButtonStyle copyWith({
    ButtonStyle? buttonStyle,
    double? borderRadius,
  }) {
    if (borderRadius != null) {
      return HoroskopeButtonStyle(
        buttonStyle: (buttonStyle ?? _buttonStyle).copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        borderRadius: borderRadius,
      );
    }
    return HoroskopeButtonStyle(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      borderRadius: this.borderRadius,
    );
  }
}
