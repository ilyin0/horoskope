abstract class NatalChartsRepository {
  Future<Map<String, String>> getPersonalityCharts(int userId);
  Future<Map<String, String>> getAdditionalCharts(int userId);
}
