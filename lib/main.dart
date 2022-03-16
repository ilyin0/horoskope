import 'package:flutter/material.dart';
import 'package:horoskope/di/configuration.dart';
import 'package:horoskope/presentation/app.dart';

void main() {
  configureDependencies();
  runApp(const App());
}
