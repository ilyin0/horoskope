class HoroskopeState {
  final int tab;
  final String? todayForecast;
  final String? tomorrowForecast;

  const HoroskopeState({
    this.tab = 0,
    this.todayForecast,
    this.tomorrowForecast,
  });

  HoroskopeState copyWith({
    int? tab,
    String? todayForecast,
    String? tomorrowForecast,
  }) {
    return HoroskopeState(
      tab: tab ?? this.tab,
      todayForecast: todayForecast ?? this.todayForecast,
      tomorrowForecast: tomorrowForecast ?? this.tomorrowForecast,
    );
  }

  String? get forecast {
    switch (tab) {
      case 0:
        return todayForecast;
      case 1:
        return tomorrowForecast;
      default:
        return _workInProgressForecast;
    }
  }
}

const _workInProgressForecast =
    'We\'re currently working on creating this forecast for you! Stay connected!';
