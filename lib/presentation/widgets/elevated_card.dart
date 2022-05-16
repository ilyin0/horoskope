import 'package:flutter/material.dart';
import 'package:horoskope/presentation/utils/default_values.dart' as defaults;

class ElevatedCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color shadowColor;
  final double width;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;

  const ElevatedCard({
    Key? key,
    required this.child,
    this.color = defaults.elevatedCardColor,
    this.shadowColor = defaults.elevatedCardShadowColor,
    this.width = double.infinity,
    this.padding = const EdgeInsets.all(20),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: kThemeAnimationDuration,
        child: child,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
