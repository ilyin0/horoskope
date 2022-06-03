class OnboardingState {
  final int page;

  const OnboardingState({
    required this.page,
  });

  OnboardingState copyWith({
    int? page,
  }) {
    return OnboardingState(
      page: page ?? this.page,
    );
  }
}
