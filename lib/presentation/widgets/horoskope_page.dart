import 'package:flutter/material.dart';

class HoroskopePage extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? background;
  final Color backgroundColor;

  HoroskopePage({
    Key? key,
    this.body = const SizedBox(),
    this.appBar,
    Widget? background,
    ImageProvider? backgroundImage,
    this.bottomNavigationBar,
    this.scaffoldKey,
    this.backgroundColor = Colors.white,
  })  : assert(background == null || backgroundImage == null),
        background = backgroundImage != null
            ? Image(
                image: backgroundImage,
                fit: BoxFit.cover,
              )
            : background,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final background = this.background;

    return Stack(
      children: [
        Container(color: backgroundColor),
        if (background != null)
          SizedBox.expand(
            child: background,
          ),
        Scaffold(
          key: key,
          appBar: appBar,
          body: SafeArea(
            child: body,
          ),
          backgroundColor: Colors.transparent,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ],
    );
  }
}
