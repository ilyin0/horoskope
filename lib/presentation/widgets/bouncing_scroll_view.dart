import 'package:flutter/material.dart';

class BouncingScrollView extends StatelessWidget {
  final Widget? child;

  final Axis _scrollDirection;

  const BouncingScrollView({
    Key? key,
    this.child,
  })  : _scrollDirection = Axis.vertical,
        super(key: key);

  const BouncingScrollView.horizontal({Key? key, this.child})
      : _scrollDirection = Axis.horizontal,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: _scrollDirection,
      child: child,
    );
  }
}
