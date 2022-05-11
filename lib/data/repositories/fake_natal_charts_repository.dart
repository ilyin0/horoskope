import 'package:horoskope/domain/repositories/natal_charts_repository.dart';

class FakeNatalChartsRepository implements NatalChartsRepository {
  @override
  Future<Map<String, String>> getPersonalityCharts(int userId) {
    return Future.value(
      {
        'Sun':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor',
        'Moon':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor',
      },
    );
  }

  @override
  Future<Map<String, String>> getAdditionalCharts(int userId) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => {
        // 'Mercury':
        //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor',
        // 'Jupyter':
        //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor',
      },
    );
  }
}
