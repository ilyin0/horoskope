import 'package:flutter/material.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/themes/styles/horoskope_button_style.dart';

const double _defaultBorderRadius = 12;

class HoroskopeButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final HoroskopeButtonStyle? style;
  final HoroskopeButtonThemeData? defaultButtonTheme;

  const HoroskopeButton({
    Key? key,
    required this.child,
    this.onTap,
    this.style,
    this.defaultButtonTheme,
  })  : assert(style != null || defaultButtonTheme != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultButtonStyle = defaultButtonTheme?.primary.buttonStyle;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          style?.borderRadius ?? _defaultBorderRadius,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(2, 2),
            color: style?.buttonStyle.shadowColor?.resolve({}) ??
                defaultButtonStyle?.shadowColor?.resolve({}) ??
                Colors.transparent,
            blurRadius: 4,
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap,
        child: child,
        style: style?.buttonStyle ?? defaultButtonTheme!.primary.buttonStyle,
      ),
    );
  }
}
