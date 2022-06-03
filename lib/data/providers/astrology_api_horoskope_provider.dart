import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class AstrologyApiHoroskopeProvider {
  static const _host = 'https://json.astrologyapi.com/v1';

  static const _userId = '619810';
  static const _apiKey = 'ecb0abbecce2e09135beae87632f4c24';

  static String get _authorizationHeaderValue =>
      'Basic ' +
      base64Encode(
        utf8.encode('$_userId:$_apiKey'),
      );

  static Map<String, String> get _headers => {
        'Authorization': _authorizationHeaderValue,
      };

  static Future<String?> getDailyPrediction({
    required DateTime birthDate,
    required String name,
  }) async {
    final requestBody = {
      'day': birthDate.day.toString(),
      'month': birthDate.month.toString(),
      'year': birthDate.year.toString(),
      'name': name,
    };

    final response = await http.post(
      Uri.parse('$_host/numero_prediction/daily'),
      headers: _headers,
      body: requestBody,
    );

    final dailyPredictionData = _AstrologyApiDailyPrediction.fromJson(
      jsonDecode(response.body),
    );

    return dailyPredictionData.prediction;
  }
}

class _AstrologyApiDailyPrediction {
  final String prediction;
  final String luckyColor;
  final String luckyNumber;
  final String predictionDate;

  const _AstrologyApiDailyPrediction({
    required this.prediction,
    required this.luckyColor,
    required this.luckyNumber,
    required this.predictionDate,
  });

  factory _AstrologyApiDailyPrediction.fromJson(Map<String, dynamic> json) {
    return _AstrologyApiDailyPrediction(
      prediction: json['prediction'],
      luckyColor: json['lucky_color'],
      luckyNumber: json['lucky_number'],
      predictionDate: json['prediction_date'],
    );
  }
}
