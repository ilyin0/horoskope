import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';

abstract class HoroskopeRepository {
  Future<String?> getTodayForecast({
    required ZodiacSign sign,
  });

  Future<String?> getTomorrowForecast({
    required ZodiacSign sign,
  });

  Future<String?> getTodayForecastByBirthDateAndName({
    required DateTime birthDate,
    required String name,
  });

  Future<Map<String, String>?> getCompatibility({
    required FriendData friendData,
  });
}
