import 'package:flutter/material.dart';

class LoadingText extends StatelessWidget {
  final int lines;
  final double maxWidth;
  final double minWidth;
  final double leading;

  const LoadingText({
    Key? key,
    this.lines = 2,
    this.maxWidth = double.infinity,
    this.minWidth = 80,
    this.leading = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < lines - 1; ++i) ...[
          LoadingTextLine(width: maxWidth),
          SizedBox(height: leading),
        ],
        LoadingTextLine(width: minWidth),
      ],
    );
  }
}

class LoadingTextLine extends StatelessWidget {
  final double width;

  const LoadingTextLine({
    Key? key,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
