import 'package:flutter/material.dart';
import 'package:horoskope/presentation/utils/build_context_ext.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.horoskope),
      ),
      body: Center(
        child: Text(
          context.localizations.homePage,
        ),
      ),
    );
  }
}
