import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/app/app_cubit.dart';
import 'package:horoskope/presentation/pages/auth/auth_page_cubit.dart';
import 'package:injectable/injectable.dart';

void disposeAppCubit(AppCubit appCubit) => appCubit.dispose();

@module
abstract class AppModule {
  @Singleton(dispose: disposeAppCubit)
  AppCubit appCubit(AuthService authService) => AppCubit(
        authService,
      )..init();

  AuthPageCubit authPageCubit(AuthService authService) => AuthPageCubit(
        authService,
      );
}
