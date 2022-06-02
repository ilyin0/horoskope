import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/app/app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthService _authService;

  AppCubit(this._authService)
      : super(
          const AppState(authState: AuthState.unknown),
        );

  late StreamSubscription _authUserSubscription;

  void init() {
    _authUserSubscription = _authService.authUserStream.listen(
      (user) {
        if (user == null) {
          emit(
            state.copyWith(authState: AuthState.unauthenticated),
          );
        } else {
          emit(
            state.copyWith(authState: AuthState.authenticated),
          );
        }
      },
    );
  }

  void dispose() {
    _authUserSubscription.cancel();
  }
}
