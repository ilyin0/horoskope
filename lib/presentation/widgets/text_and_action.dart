import 'package:flutter/material.dart';

abstract class TextAndActionTextThemeData {
  TextStyle get textAndActionTextStyle;
  TextStyle get textAndActionActionStyle;
}

class TextAndAction extends StatelessWidget {
  final String text;
  final String actionText;
  final TextAndActionTextThemeData theme;
  final VoidCallback? onActionTap;

  const TextAndAction({
    Key? key,
    required this.text,
    required this.actionText,
    required this.theme,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: theme.textAndActionTextStyle),
        GestureDetector(
          child: Text(actionText, style: theme.textAndActionActionStyle),
          onTap: onActionTap,
        )
      ],
    );
  }
}
