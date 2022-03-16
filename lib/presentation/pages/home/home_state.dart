class HomeState {
  final String todayForecast;

  const HomeState({
    required this.todayForecast,
  });

  HomeState copyWith({
    String? todayForecast,
  }) {
    return HomeState(
      todayForecast: todayForecast ?? this.todayForecast,
    );
  }
}
