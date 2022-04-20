import 'package:horoskope/data/repositories/fake_compatibility_repository.dart';
import 'package:horoskope/data/repositories/fake_horoskope_repository.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ContentDataModule {
  HoroskopeRepository astrodataRepository() => FakeHoroskopeRepository();

  CompatibilityRepository compatibilityRepository() =>
      FakeCompatibilityRepository();
}
