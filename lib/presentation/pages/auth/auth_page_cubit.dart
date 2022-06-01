import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horoskope/domain/services/auth_service.dart';
import 'package:horoskope/presentation/pages/auth/auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  final AuthService _authService;

  AuthPageCubit(this._authService) : super(AuthPageState());

  void signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final error = await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (error != null) {
      emit(
        state.copyWith(error: error),
      );
    }
  }

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final error = await _authService.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (error != null) {
      emit(
        state.copyWith(error: error),
      );
    }
  }

  void signInAnonymously() async {
    final error = await _authService.signInAnonymously();
    if (error != null) {
      emit(
        state.copyWith(error: error),
      );
    }
  }
}
