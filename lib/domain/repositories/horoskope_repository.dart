import 'package:horoskope/domain/entities/zodiac_signs.dart';

abstract class HoroskopeRepository {
  Future<String> getTodayForecast({
    required ZodiacSigns sign,
    required DateTime dateTime,
  });
}
