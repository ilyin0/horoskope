import 'dart:convert';

import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:http/http.dart' as http;

abstract class SameerkumarDailyHoroskopeProvider {
  static const _host = 'https://aztro.sameerkumar.website';

  static Future<String?> getTodayForecast({
    required ZodiacSign sign,
  }) =>
      _getDailyForecast(sign: sign, day: _Day.today);

  static Future<String?> getTomorrowForecast({
    required ZodiacSign sign,
  }) =>
      _getDailyForecast(sign: sign, day: _Day.tomorrow);

  static Future<String?> _getDailyForecast({
    required ZodiacSign sign,
    required _Day day,
  }) async {
    final response = await http.post(
      Uri.parse('$_host?sign=${sign.name}&day=${day.name}'),
    );

    final dailyHoroskope = _DailyHoroskope.fromJson(
      jsonDecode(response.body),
    );

    return dailyHoroskope.description;
  }
}

enum _Day { today, tomorrow }

class _DailyHoroskope {
  final String dateRange;
  final String currentDate;
  final String description;
  final String compatibility;
  final String mood;
  final String color;
  final String luckyNumber;
  final String luckyTime;

  _DailyHoroskope({
    required this.dateRange,
    required this.currentDate,
    required this.description,
    required this.compatibility,
    required this.mood,
    required this.color,
    required this.luckyNumber,
    required this.luckyTime,
  });

  factory _DailyHoroskope.fromJson(Map<String, dynamic> json) {
    return _DailyHoroskope(
      dateRange: json['date_range'],
      currentDate: json['current_date'],
      description: json['description'],
      compatibility: json['compatibility'],
      mood: json['mood'],
      color: json['color'],
      luckyNumber: json['lucky_number'],
      luckyTime: json['lucky_time'],
    );
  }
}
