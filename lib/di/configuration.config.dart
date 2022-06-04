// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/repositories/compatibility_repository.dart' as _i15;
import '../domain/repositories/horoskope_repository.dart' as _i16;
import '../domain/repositories/natal_charts_repository.dart' as _i5;
import '../domain/repositories/user_data_repository.dart' as _i6;
import '../domain/repositories/user_friends_repository.dart' as _i8;
import '../domain/services/auth_service.dart' as _i3;
import '../presentation/app/app_cubit.dart' as _i11;
import '../presentation/pages/add_friend/add_friend_cubit.dart' as _i10;
import '../presentation/pages/auth/auth_page_cubit.dart' as _i13;
import '../presentation/pages/compatibility_details/compatibility_details_cubit.dart'
    as _i18;
import '../presentation/pages/home/fragments/about_you/about_you_cubit.dart'
    as _i9;
import '../presentation/pages/home/fragments/compatibility/compatibility_cubit.dart'
    as _i14;
import '../presentation/pages/home/fragments/horoskope/horoskope_cubit.dart'
    as _i19;
import '../presentation/pages/home/home_page.dart' as _i4;
import '../presentation/pages/onboarding/onboarding_cubit.dart' as _i17;
import 'modules/app_module.dart' as _i12;
import 'modules/content_data_module.dart' as _i7;
import 'modules/services_module.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i8.UserFriendsRepository>(
      contentDataModule.userFriendsRepository(get<_i3.AuthService>()));
  gh.factory<_i9.AboutYouCubit>(
      () => _i9.AboutYouCubit(get<_i5.NatalChartsRepository>()));
  gh.factory<_i10.AddFriendCubit>(
      () => appModule.addFriendCubit(get<_i8.UserFriendsRepository>()));
  gh.singleton<_i11.AppCubit>(
      appModule.appCubit(get<_i3.AuthService>(), get<_i6.UserDataRepository>()),
      dispose: _i12.disposeAppCubit);
  gh.factory<_i13.AuthPageCubit>(
      () => appModule.authPageCubit(get<_i3.AuthService>()));
  gh.factory<_i14.CompatibilityCubit>(
      () => _i14.CompatibilityCubit(get<_i8.UserFriendsRepository>()));
  gh.factory<_i15.CompatibilityRepository>(() =>
      contentDataModule.compatibilityRepository(get<_i6.UserDataRepository>()));
  gh.factory<_i16.HoroskopeRepository>(() =>
      contentDataModule.astrodataRepository(get<_i6.UserDataRepository>()));
  gh.factory<_i17.OnboardingCubit>(() => appModule.onboardingCubit(
      get<_i3.AuthService>(), get<_i6.UserDataRepository>()));
  gh.factory<_i18.CompatibilityDetailsCubit>(() =>
      appModule.compatibilityDetailsCubit(
          get<_i16.HoroskopeRepository>(), get<_i6.UserDataRepository>()));
  gh.factory<_i19.HoroskopeCubit>(
      () => _i19.HoroskopeCubit(get<_i16.HoroskopeRepository>()));
  return get;
}

class _$ServicesModule extends _i20.ServicesModule {}

class _$ContentDataModule extends _i7.ContentDataModule {}

class _$AppModule extends _i12.AppModule {}
