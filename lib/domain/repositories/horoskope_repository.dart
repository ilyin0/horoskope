import 'package:horoskope/domain/entities/zodiac_signs.dart';

abstract class HoroskopeRepository {
  Future<String> getTodayForecast({
    required ZodiacSign sign,
    required DateTime dateTime,
  });
}
