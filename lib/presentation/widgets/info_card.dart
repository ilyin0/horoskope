import 'package:flutter/material.dart';
import 'package:horoskope/presentation/utils/default_values.dart' as defaults;
import 'package:horoskope/presentation/widgets/elevated_card.dart';

abstract class InfoCardTextTheme {
  TextStyle get infoCardBigTitle;
  TextStyle get infoCardTitle;
  TextStyle get infoCardBody;
}

class InfoCard extends StatelessWidget {
  final String body;
  final String? title;
  final Color color;
  final Color shadowColor;
  final double width;
  final bool big;
  final InfoCardTextTheme textTheme;

  const InfoCard({
    Key? key,
    required this.body,
    required this.textTheme,
    this.title,
    this.color = defaults.infoCardColor,
    this.shadowColor = defaults.infoCardShadowColor,
    this.width = double.infinity,
    this.big = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = this.title;

    return ElevatedCard(
      color: color,
      shadowColor: shadowColor,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title,
              style: big ? textTheme.infoCardBigTitle : textTheme.infoCardTitle,
            ),
            const SizedBox(height: 8)
          ],
          Text(
            body,
            style: textTheme.infoCardBody,
          ),
        ],
      ),
    );
  }
}