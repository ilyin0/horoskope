import 'package:horoskope/data/providers/daily_horoskope_provider.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';

class RemoteHoroskopeRepository implements HoroskopeRepository {
  @override
  Future<String?> getTodayForecast({
    required ZodiacSign sign,
    required DateTime dateTime,
  }) {
    return DailyHoroskopeProvider.getTodayForecast(sign: sign);
  }
}
