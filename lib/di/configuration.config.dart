// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/compatibility_repository.dart' as _i3;
import '../domain/repositories/horoskope_repository.dart' as _i5;
import '../presentation/pages/home/fragments/compatibility/compatibility_cubit.dart'
    as _i6;
import '../presentation/pages/home/fragments/horoskope/horoskope_cubit.dart'
    as _i7;
import '../presentation/pages/home/home_page.dart' as _i4;
import 'modules/content_data_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final contentDataModule = _$ContentDataModule();
  gh.factory<_i3.CompatibilityRepository>(
      () => contentDataModule.compatibilityRepository());
  gh.factory<_i4.HomeCubit>(() => _i4.HomeCubit());
  gh.factory<_i5.HoroskopeRepository>(
      () => contentDataModule.astrodataRepository());
  gh.factory<_i6.CompatibilityCubit>(
      () => _i6.CompatibilityCubit(get<_i3.CompatibilityRepository>()));
  gh.factory<_i7.HoroskopeCubit>(
      () => _i7.HoroskopeCubit(get<_i5.HoroskopeRepository>()));
  return get;
}

class _$ContentDataModule extends _i8.ContentDataModule {}
