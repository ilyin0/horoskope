class AuthPageState {
  final String? error;

  AuthPageState({
    this.error,
  });

  AuthPageState copyWith({
    String? error,
  }) {
    return AuthPageState(
      error: error ?? this.error,
    );
  }
}
