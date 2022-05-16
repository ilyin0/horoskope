import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/themes/horoskope_theme.dart';
import 'package:horoskope/presentation/widgets/elevated_card.dart';
import 'package:horoskope/presentation/widgets/horoskope_circle_avatar.dart';

abstract class CompatibilityShortCardColorThemeData
    implements HoroskopeBaseColorThemeData {
  Color get compatibilityCircleAvatarColor;
  Color get compatibilityCircleAvatarBorderColor;
  Color get compatibilityCircleAvatarBackgroundColor;
}

abstract class CompatibilityShortCardTextThemeData
    implements HoroskopeBaseTextThemeData {
  TextStyle get compatibilityCircleAvatarText;
  TextStyle get compatibilityShortCardRate;
  TextStyle get compatibilityShortCardTitle;
  TextStyle get compatibilityShortCardSubtitle;
}

typedef CompatibilityShortCartThemeData = HoroskopeThemeData<
    CompatibilityShortCardTextThemeData,
    CompatibilityShortCardColorThemeData,
    HoroskopeBaseButtonThemeData>;

class CompatibilityShortCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final num? rate;
  final CompatibilityShortCartThemeData theme;
  final VoidCallback? onTap;

  const CompatibilityShortCard({
    Key? key,
    required this.title,
    required this.theme,
    this.subtitle,
    this.rate,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subtitle = this.subtitle;
    final rate = this.rate;

    return ElevatedCard(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              HoroskopeCircleAvatar(
                text: title.substring(0, 2).toUpperCase(),
                color: theme.colorTheme.compatibilityCircleAvatarColor,
                backgroundColor:
                    theme.colorTheme.compatibilityCircleAvatarBackgroundColor,
                borderColor:
                    theme.colorTheme.compatibilityCircleAvatarBorderColor,
                textStyle: theme.textTheme.compatibilityCircleAvatarText,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.compatibilityShortCardTitle,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: theme.textTheme.compatibilityShortCardSubtitle,
                    ),
                  ],
                ],
              ),
            ],
          ),
          Row(
            children: [
              if (rate != null)
                Text(
                  rate.toString(),
                  style: theme.textTheme.compatibilityShortCardRate,
                ),
              const SizedBox(width: 8),
              SvgPicture.asset(AppVectorAsset.arrowRight),
            ],
          )
        ],
      ),
    );
  }
}
