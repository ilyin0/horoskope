import 'package:horoskope/data/repositories/fake_astrodata_repository.dart';
import 'package:horoskope/domain/repositories/astrodata_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ContentDataModule {
  AstrodataRepository astrodataRepository() => FakeAstrodataRepository();
}
