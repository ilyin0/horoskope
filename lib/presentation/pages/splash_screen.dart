import 'package:flutter/material.dart';
import 'package:horoskope/presentation/app/auth_navigation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthNavigationController(
      child: const SizedBox(),
    );
  }
}
