import 'package:flutter/material.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';

class InfoCardStyle {
  final Color color;
  final Color shadowColor;
  final TextStyle? title;
  final TextStyle? body;

  InfoCardStyle({
    required this.color,
    required this.shadowColor,
    this.title,
    this.body,
  });
}

class InfoCard extends StatelessWidget {
  final String body;
  final String? title;
  final double width;
  final InfoCardStyle style;

  const InfoCard({
    Key? key,
    required this.body,
    required this.style,
    this.title,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    return ElevatedCard(
      color: style.color,
      shadowColor: style.shadowColor,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(title, style: style.title),
            const SizedBox(height: 8)
          ],
          Text(body, style: style.body),
        ],
      ),
    );
  }
}
