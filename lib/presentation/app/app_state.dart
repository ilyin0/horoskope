import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final AuthState authState;

  const AppState({
    required this.authState,
  });

  AppState copyWith({
    AuthState? authState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
    );
  }

  @override
  List<Object?> get props => [authState];
}

enum AuthState {
  unknown,
  authenticated,
  unauthenticated,
}
