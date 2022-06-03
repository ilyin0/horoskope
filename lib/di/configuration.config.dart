// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/compatibility_repository.dart' as _i12;
import '../domain/repositories/horoskope_repository.dart' as _i13;
import '../domain/repositories/natal_charts_repository.dart' as _i5;
import '../domain/repositories/user_data_repository.dart' as _i6;
import '../domain/services/auth_service.dart' as _i3;
import '../presentation/app/app_cubit.dart' as _i9;
import '../presentation/pages/auth/auth_page_cubit.dart' as _i11;
import '../presentation/pages/compatibility_details/compatibility_details_cubit.dart'
    as _i16;
import '../presentation/pages/home/fragments/about_you/about_you_cubit.dart'
    as _i8;
import '../presentation/pages/home/fragments/compatibility/compatibility_cubit.dart'
    as _i15;
import '../presentation/pages/home/fragments/horoskope/horoskope_cubit.dart'
    as _i17;
import '../presentation/pages/home/home_page.dart' as _i4;
import '../presentation/pages/onboarding/onboarding_cubit.dart' as _i14;
import 'modules/app_module.dart' as _i10;
import 'modules/content_data_module.dart' as _i7;
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
  gh.factory<_i5.NatalChartsRepository>(
      () => contentDataModule.natalChartsRepository());
  gh.singleton<_i6.UserDataRepository>(
      contentDataModule.userDataRepository(get<_i3.AuthService>()),
      dispose: _i7.disposeUserDataRepository);
  gh.factory<_i8.AboutYouCubit>(
      () => _i8.AboutYouCubit(get<_i5.NatalChartsRepository>()));
  gh.singleton<_i9.AppCubit>(
      appModule.appCubit(get<_i3.AuthService>(), get<_i6.UserDataRepository>()),
      dispose: _i10.disposeAppCubit);
  gh.factory<_i11.AuthPageCubit>(
      () => appModule.authPageCubit(get<_i3.AuthService>()));
  gh.factory<_i12.CompatibilityRepository>(() =>
      contentDataModule.compatibilityRepository(get<_i6.UserDataRepository>()));
  gh.factory<_i13.HoroskopeRepository>(() =>
      contentDataModule.astrodataRepository(get<_i6.UserDataRepository>()));
  gh.factory<_i14.OnboardingCubit>(() => appModule.onboardingCubit(
      get<_i3.AuthService>(), get<_i6.UserDataRepository>()));
  gh.factory<_i15.CompatibilityCubit>(
      () => _i15.CompatibilityCubit(get<_i12.CompatibilityRepository>()));
  gh.factory<_i16.CompatibilityDetailsCubit>(() =>
      _i16.CompatibilityDetailsCubit(get<_i12.CompatibilityRepository>()));
  gh.factory<_i17.HoroskopeCubit>(
      () => _i17.HoroskopeCubit(get<_i13.HoroskopeRepository>()));
  return get;
}

class _$ServicesModule extends _i18.ServicesModule {}

class _$ContentDataModule extends _i7.ContentDataModule {}

class _$AppModule extends _i10.AppModule {}
