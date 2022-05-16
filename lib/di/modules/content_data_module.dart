import 'package:horoskope/data/repositories/fake_compatibility_repository.dart';
import 'package:horoskope/data/repositories/fake_horoskope_repository.dart';
import 'package:horoskope/data/repositories/fake_natal_charts_repository.dart';
import 'package:horoskope/data/repositories/fake_user_data_repository.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:horoskope/domain/repositories/natal_charts_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ContentDataModule {
  HoroskopeRepository astrodataRepository() => FakeHoroskopeRepository();

  NatalChartsRepository natalChartsRepository() => FakeNatalChartsRepository();

  UserDataRepository userDataRepository() => FakeUserDataRepository();

  CompatibilityRepository compatibilityRepository(
    UserDataRepository userDataRepository,
  ) =>
      FakeCompatibilityRepository(userDataRepository);
}
