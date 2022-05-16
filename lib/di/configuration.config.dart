// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/compatibility_repository.dart' as _i8;
import '../domain/repositories/horoskope_repository.dart' as _i4;
import '../domain/repositories/natal_charts_repository.dart' as _i5;
import '../domain/repositories/user_data_repository.dart' as _i6;
import '../presentation/pages/compatibility_details/compatibility_details_cubit.dart'
    as _i11;
import '../presentation/pages/home/fragments/about_you/about_you_cubit.dart'
    as _i7;
import '../presentation/pages/home/fragments/compatibility/compatibility_cubit.dart'
    as _i10;
import '../presentation/pages/home/fragments/horoskope/horoskope_cubit.dart'
    as _i9;
import '../presentation/pages/home/home_page.dart' as _i3;
import 'modules/content_data_module.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final contentDataModule = _$ContentDataModule();
  gh.factory<_i3.HomeCubit>(() => _i3.HomeCubit());
  gh.factory<_i4.HoroskopeRepository>(
      () => contentDataModule.astrodataRepository());
  gh.factory<_i5.NatalChartsRepository>(
      () => contentDataModule.natalChartsRepository());
  gh.factory<_i6.UserDataRepository>(
      () => contentDataModule.userDataRepository());
  gh.factory<_i7.AboutYouCubit>(
      () => _i7.AboutYouCubit(get<_i5.NatalChartsRepository>()));
  gh.factory<_i8.CompatibilityRepository>(() =>
      contentDataModule.compatibilityRepository(get<_i6.UserDataRepository>()));
  gh.factory<_i9.HoroskopeCubit>(
      () => _i9.HoroskopeCubit(get<_i4.HoroskopeRepository>()));
  gh.factory<_i10.CompatibilityCubit>(
      () => _i10.CompatibilityCubit(get<_i8.CompatibilityRepository>()));
  gh.factory<_i11.CompatibilityDetailsCubit>(
      () => _i11.CompatibilityDetailsCubit(get<_i8.CompatibilityRepository>()));
  return get;
}

class _$ContentDataModule extends _i12.ContentDataModule {}
