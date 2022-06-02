import 'package:horoskope/domain/entities/zodiac_sign.dart';

abstract class HoroskopeRepository {
  Future<String?> getTodayForecast({
    required ZodiacSign sign,
    required DateTime dateTime,
  });
}
