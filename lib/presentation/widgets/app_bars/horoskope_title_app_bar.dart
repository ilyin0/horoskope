import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horoskope/presentation/resources/app_vector_asset.dart';
import 'package:horoskope/presentation/widgets/app_bars/horoskope_app_bar.dart';

const _defaultTitleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 36,
);

class HoroskopeTitleAppBar extends HoroskopeAppBar {
  HoroskopeTitleAppBar({
    Key? key,
    required String title,
    TextStyle? titleStyle,
    Color? iconColor,
    double? height,
  }) : super(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppVectorAsset.horoskopeEmptyIcon,
                  height: 40,
                  color: iconColor,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: titleStyle ?? _defaultTitleStyle,
                ),
              ],
            ),
          ),
          height: height,
        );
}
