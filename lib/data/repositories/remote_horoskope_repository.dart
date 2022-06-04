import 'package:horoskope/data/providers/astrology_api_horoskope_provider.dart';
import 'package:horoskope/data/providers/ohmanda_daily_horoskope_provider.dart';
import 'package:horoskope/data/providers/sameerkumar_daily_horoskope_provider.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:horoskope/domain/repositories/horoskope_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';

class RemoteHoroskopeRepository implements HoroskopeRepository {
  final UserDataRepository _userDataRepository;

  const RemoteHoroskopeRepository(this._userDataRepository);

  @override
  Future<String?> getTodayForecast({
    required ZodiacSign sign,
  }) {
    return OhmandaDailyHoroskopeProvider.getTodayForecast(sign: sign);
  }

  @override
  Future<String?> getTomorrowForecast({
    required ZodiacSign sign,
  }) async {
    final userData = _userDataRepository.userData;
    if (userData != null) {
      return SameerkumarDailyHoroskopeProvider.getTomorrowForecast(
        sign: zodiacSignFromBirthDate(userData.birthDateTime),
      );
    }
    return null;
  }

  @override
  Future<String?> getTodayForecastByBirthDateAndName({
    required DateTime birthDate,
    required String name,
  }) async {
    final userData = _userDataRepository.userData;
    if (userData != null) {
      return AstrologyApiHoroskopeProvider.getDailyPrediction(
        birthDate: userData.birthDateTime,
        name: userData.name,
      );
    }
    return null;
  }
}
