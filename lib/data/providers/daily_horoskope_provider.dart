import 'dart:convert';

import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:http/http.dart' as http;

class DailyHoroskopeProvider {
  static const _host = 'https://ohmanda.com/api/horoscope';

  static Future<String?> getTodayForecast({
    required ZodiacSign sign,
  }) async {
    final response = await http.get(
      Uri.parse('$_host/${sign.name}'),
    );

    final dailyHoroskope = _DailyHoroskope.fromJson(
      jsonDecode(response.body),
    );

    return dailyHoroskope.forecast;
  }
}

class _DailyHoroskope {
  final ZodiacSign sign;
  final DateTime date;
  final String? forecast;

  const _DailyHoroskope({
    required this.sign,
    required this.date,
    required this.forecast,
  });

  factory _DailyHoroskope.fromJson(Map<String, dynamic> json) {
    return _DailyHoroskope(
      sign: zodiacSignFromString(json['sign']),
      date: DateTime.parse(json['date']),
      forecast: json['horoscope'],
    );
  }
}
