import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/app/app_cubit.dart';
import 'package:horoskope/presentation/pages/auth/auth_page_cubit.dart';
import 'package:horoskope/presentation/pages/onboarding/onboarding_cubit.dart';
import 'package:injectable/injectable.dart';

void disposeAppCubit(AppCubit appCubit) => appCubit.dispose();

@module
abstract class AppModule {
  @Singleton(dispose: disposeAppCubit)
  AppCubit appCubit(
    AuthService authService,
    UserDataRepository userDataRepository,
  ) =>
      AppCubit(
        authService,
        userDataRepository,
      )..init();

  AuthPageCubit authPageCubit(AuthService authService) => AuthPageCubit(
        authService,
      );

  OnboardingCubit onboardingCubit(
    AuthService authService,
    UserDataRepository userDataRepository,
  ) =>
      OnboardingCubit(
        authService,
        userDataRepository,
      );
}
