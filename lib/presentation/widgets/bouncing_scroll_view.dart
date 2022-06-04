import 'package:flutter/material.dart';

class BouncingScrollView extends StatelessWidget {
  final Widget? child;

  final Axis _scrollDirection;
  final ScrollController? controller;
  final bool reverse;

  const BouncingScrollView({
    Key? key,
    this.child,
    this.controller,
    this.reverse = false,
  })  : _scrollDirection = Axis.vertical,
        super(key: key);

  const BouncingScrollView.horizontal({
    Key? key,
    this.child,
    this.controller,
    this.reverse = false,
  })  : _scrollDirection = Axis.horizontal,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: _scrollDirection,
      controller: controller,
      reverse: reverse,
      child: child,
    );
  }
}
