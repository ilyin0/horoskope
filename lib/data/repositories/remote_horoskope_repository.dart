import 'package:horoskope/data/providers/ohmanda_daily_horoskope_provider.dart';
import 'package:horoskope/data/providers/sameerkumar_daily_horoskope_provider.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';

class RemoteHoroskopeRepository implements HoroskopeRepository {
  @override
  Future<String?> getTodayForecast({
    required ZodiacSign sign,
  }) {
    return OhmandaDailyHoroskopeProvider.getTodayForecast(sign: sign);
  }

  @override
  Future<String?> getTomorrowForecast({required ZodiacSign sign}) {
    return SameerkumarDailyHoroskopeProvider.getTomorrowForecast(sign: sign);
  }
}
