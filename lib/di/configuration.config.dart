// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/astrodata_repository.dart' as _i3;
import '../presentation/pages/home/home_cubit.dart' as _i4;
import 'modules/content_data_module.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final contentDataModule = _$ContentDataModule();
  gh.factory<_i3.AstrodataRepository>(
      () => contentDataModule.astrodataRepository());
  gh.factory<_i4.HomeCubit>(
      () => _i4.HomeCubit(get<_i3.AstrodataRepository>()));
  return get;
}

class _$ContentDataModule extends _i5.ContentDataModule {}
