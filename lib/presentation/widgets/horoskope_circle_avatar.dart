import 'package:flutter/material.dart';

class HoroskopeCircleAvatar extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final TextStyle textStyle;

  const HoroskopeCircleAvatar({
    Key? key,
    this.color = Colors.red,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
    this.text = 'UN',
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _CircleAvatarBorder(
          backgroundColor: backgroundColor,
          borderColor: borderColor,
        ),
        _CircleAvatar(
          color: color,
          text: text,
          textStyle: textStyle,
        ),
      ],
    );
  }
}

class _CircleAvatarBorder extends StatelessWidget {
  const _CircleAvatarBorder({
    Key? key,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  final Color backgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 1.5),
      ),
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  const _CircleAvatar({
    Key? key,
    required this.color,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Color color;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
