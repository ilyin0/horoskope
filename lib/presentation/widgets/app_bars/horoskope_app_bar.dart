import 'package:flutter/material.dart';

const double _horoskopeAppBarHeight = 120;

class HoroskopeAppBar extends PreferredSize {
  HoroskopeAppBar({
    Key? key,
    required Widget child,
    double? height,
  }) : super(
          key: key,
          child: child,
          preferredSize: Size.fromHeight(height ?? _horoskopeAppBarHeight),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: super.build(context),
      ),
    );
  }
}
