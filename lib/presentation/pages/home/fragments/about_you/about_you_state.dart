class AboutYouState {
  final Map<String, String>? personalityCharts;
  final Map<String, String>? additionalCharts;

  AboutYouState({
    this.personalityCharts,
    this.additionalCharts,
  });

  AboutYouState copyWith({
    Map<String, String>? personalityCharts,
    Map<String, String>? additionalCharts,
  }) {
    return AboutYouState(
      personalityCharts: personalityCharts ?? this.personalityCharts,
      additionalCharts: additionalCharts ?? this.additionalCharts,
    );
  }
}
