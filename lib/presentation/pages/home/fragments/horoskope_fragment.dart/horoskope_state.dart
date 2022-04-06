class HoroskopeState {
  final String? todayForecast;

  const HoroskopeState({
    this.todayForecast,
  });

  HoroskopeState copyWith({
    String? todayForecast,
  }) {
    return HoroskopeState(
      todayForecast: todayForecast ?? this.todayForecast,
    );
  }
}
