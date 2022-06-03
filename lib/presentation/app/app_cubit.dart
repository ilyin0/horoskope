import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/app/app_state.dart';

class AppCubit extends Cubit<AppState> {
  final AuthService _authService;
  final UserDataRepository _userDataRepository;

  AppCubit(
    this._authService,
    this._userDataRepository,
  ) : super(const AppState(authState: AuthState.unknown));

  late StreamSubscription _userStreamSubscription;

  void init() {
    _userStreamSubscription = _userDataRepository.userStream.listen(
      (userData) {
        final authUser = _authService.currentUser;
        if (authUser == null) {
          emit(
            state.copyWith(authState: AuthState.unauthenticated),
          );
        } else if (userData == null) {
          emit(
            state.copyWith(authState: AuthState.registered),
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
    _userStreamSubscription.cancel();
  }
}
