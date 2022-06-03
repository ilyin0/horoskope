// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/compatibility_repository.dart' as _i13;
import '../domain/repositories/horoskope_repository.dart' as _i5;
import '../domain/repositories/natal_charts_repository.dart' as _i6;
import '../domain/repositories/user_data_repository.dart' as _i7;
import '../domain/services/auth_service.dart' as _i3;
import '../presentation/app/app_cubit.dart' as _i10;
import '../presentation/pages/auth/auth_page_cubit.dart' as _i12;
import '../presentation/pages/compatibility_details/compatibility_details_cubit.dart'
    as _i17;
import '../presentation/pages/home/fragments/about_you/about_you_cubit.dart'
    as _i9;
import '../presentation/pages/home/fragments/compatibility/compatibility_cubit.dart'
    as _i16;
import '../presentation/pages/home/fragments/horoskope/horoskope_cubit.dart'
    as _i14;
import '../presentation/pages/home/home_page.dart' as _i4;
import '../presentation/pages/onboarding/onboarding_cubit.dart' as _i15;
import 'modules/app_module.dart' as _i11;
import 'modules/content_data_module.dart' as _i8;
import 'modules/services_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $configureDependencies(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  final contentDataModule = _$ContentDataModule();
  final appModule = _$AppModule();
  gh.factory<_i3.AuthService>(() => servicesModule.authService());
  gh.factory<_i4.HomeCubit>(() => _i4.HomeCubit());
  gh.factory<_i5.HoroskopeRepository>(
      () => contentDataModule.astrodataRepository());
  gh.factory<_i6.NatalChartsRepository>(
      () => contentDataModule.natalChartsRepository());
  gh.singleton<_i7.UserDataRepository>(
      contentDataModule.userDataRepository(get<_i3.AuthService>()),
      dispose: _i8.disposeUserDataRepository);
  gh.factory<_i9.AboutYouCubit>(
      () => _i9.AboutYouCubit(get<_i6.NatalChartsRepository>()));
  gh.singleton<_i10.AppCubit>(
      appModule.appCubit(get<_i3.AuthService>(), get<_i7.UserDataRepository>()),
      dispose: _i11.disposeAppCubit);
  gh.factory<_i12.AuthPageCubit>(
      () => appModule.authPageCubit(get<_i3.AuthService>()));
  gh.factory<_i13.CompatibilityRepository>(() =>
      contentDataModule.compatibilityRepository(get<_i7.UserDataRepository>()));
  gh.factory<_i14.HoroskopeCubit>(
      () => _i14.HoroskopeCubit(get<_i5.HoroskopeRepository>()));
  gh.factory<_i15.OnboardingCubit>(() => appModule.onboardingCubit(
      get<_i3.AuthService>(), get<_i7.UserDataRepository>()));
  gh.factory<_i16.CompatibilityCubit>(
      () => _i16.CompatibilityCubit(get<_i13.CompatibilityRepository>()));
  gh.factory<_i17.CompatibilityDetailsCubit>(() =>
      _i17.CompatibilityDetailsCubit(get<_i13.CompatibilityRepository>()));
  return get;
}

class _$ServicesModule extends _i18.ServicesModule {}

class _$ContentDataModule extends _i8.ContentDataModule {}

class _$AppModule extends _i11.AppModule {}
