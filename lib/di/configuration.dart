import 'package:horoskope/di/configuration.config.dart';
import 'package:horoskope/di/locator.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: r'$configureDependencies',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $configureDependencies(locator);
