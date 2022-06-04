// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:horoskope/domain/entities/friend_data.dart';
import 'package:horoskope/domain/entities/gender.dart';
import 'package:horoskope/domain/entities/user_data.dart';
import 'package:http/http.dart' as http;

abstract class ApiReportsHoroskopeProvider {
  static const _host = 'https://json.apireports.com/v1';

  static const _userId = '566';
  static const _apiKey = '31964f7f85e03e3a9195c2d321c6c947';

  static String get _authorizationHeaderValue =>
      'Basic ' +
      base64Encode(
        utf8.encode('$_userId:$_apiKey'),
      );

  static Map<String, String> get _headers => {
        'Authorization': _authorizationHeaderValue,
      };

  static Future<Map<String, String>?> getCompatibility({
    required UserData userData,
    required FriendData friendData,
  }) async {
    final requestData = _CompatibilityRequestEntity.fromUserAndFriendData(
      userData: userData,
      friendData: friendData,
    ).toJson();

    final response = await http.post(
      Uri.parse('$_host/match_ashtakoot_report'),
      headers: _headers,
      body: requestData,
    );

    return _CompatibilityResponseData.fromJson(
      jsonDecode(response.body)['data'],
    ).toMap();
  }
}

class _CompatibilityPerson {
  final int day;
  final int month;
  final int year;
  final int hour;
  final int min;
  final double lat;
  final double lon;
  final double tzone;

  const _CompatibilityPerson({
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.min,
    required this.lat,
    required this.lon,
    required this.tzone,
  });

  factory _CompatibilityPerson.fromUserData(UserData userData) {
    return _CompatibilityPerson(
      day: userData.birthDateTime.day,
      month: userData.birthDateTime.month,
      year: userData.birthDateTime.year,
      hour: userData.birthDateTime.hour,
      min: userData.birthDateTime.minute,
      lat: double.parse(userData.birthPlace.latitude),
      lon: double.parse(userData.birthPlace.longitude),
      tzone: userData.birthDateTime.timeZoneOffset.inHours.toDouble(),
    );
  }

  factory _CompatibilityPerson.fromFriendData(FriendData friendData) {
    return _CompatibilityPerson(
      day: friendData.birthDateTime.day,
      month: friendData.birthDateTime.month,
      year: friendData.birthDateTime.year,
      hour: friendData.birthDateTime.hour,
      min: friendData.birthDateTime.minute,
      lat: double.parse(friendData.birthPlace.latitude),
      lon: double.parse(friendData.birthPlace.longitude),
      tzone: friendData.birthDateTime.timeZoneOffset.inHours.toDouble(),
    );
  }
}

class _CompatibilityRequestEntity {
  final int m_day;
  final int m_month;
  final int m_year;
  final int m_hour;
  final int m_min;
  final double m_lat;
  final double m_lon;
  final double m_tzone;
  final int f_day;
  final int f_month;
  final int f_year;
  final int f_hour;
  final int f_min;
  final double f_lat;
  final double f_lon;
  final double f_tzone;

  const _CompatibilityRequestEntity({
    required this.m_day,
    required this.m_year,
    required this.m_month,
    required this.m_hour,
    required this.m_min,
    required this.m_lat,
    required this.m_lon,
    required this.m_tzone,
    required this.f_day,
    required this.f_month,
    required this.f_year,
    required this.f_hour,
    required this.f_min,
    required this.f_lat,
    required this.f_lon,
    required this.f_tzone,
  });

  factory _CompatibilityRequestEntity.fromPersons({
    required _CompatibilityPerson male,
    required _CompatibilityPerson female,
  }) {
    return _CompatibilityRequestEntity(
      m_day: male.day,
      m_year: male.year,
      m_month: male.month,
      m_hour: male.hour,
      m_min: male.min,
      m_lat: male.lat,
      m_lon: male.lon,
      m_tzone: male.tzone,
      f_day: female.day,
      f_month: female.month,
      f_year: female.year,
      f_hour: female.hour,
      f_min: female.min,
      f_lat: female.lat,
      f_lon: female.lon,
      f_tzone: female.tzone,
    );
  }

  factory _CompatibilityRequestEntity.fromUserAndFriendData({
    required UserData userData,
    required FriendData friendData,
  }) {
    final _CompatibilityPerson male;
    final _CompatibilityPerson female;

    if (userData.gender == Gender.male) {
      male = _CompatibilityPerson.fromUserData(userData);
      female = _CompatibilityPerson.fromFriendData(friendData);
    } else {
      male = _CompatibilityPerson.fromFriendData(friendData);
      female = _CompatibilityPerson.fromUserData(userData);
    }

    return _CompatibilityRequestEntity.fromPersons(
      male: male,
      female: female,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'm_day': m_day.toString(),
      'm_year': m_year.toString(),
      'm_month': m_month.toString(),
      'm_hour': m_hour.toString(),
      'm_min': m_min.toString(),
      'm_lat': m_lat.toString(),
      'm_lon': m_lon.toString(),
      'm_tzone': m_tzone.toString(),
      'f_day': f_day.toString(),
      'f_month': f_month.toString(),
      'f_year': f_year.toString(),
      'f_hour': f_hour.toString(),
      'f_min': f_min.toString(),
      'f_lat': f_lat.toString(),
      'f_lon': f_lon.toString(),
      'f_tzone': f_tzone.toString(),
    };
  }
}

class _CompatibilityResponseData {
  final _CompatibilityDetails varna;
  final _CompatibilityDetails vashya;
  final _CompatibilityDetails tara;
  final _CompatibilityDetails yoni;
  final _CompatibilityDetails maitri;
  final _CompatibilityDetails gan;
  final _CompatibilityDetails bhakut;
  final _CompatibilityDetails nadi;
  final int total;
  final String? conclusion;

  const _CompatibilityResponseData({
    required this.varna,
    required this.vashya,
    required this.tara,
    required this.yoni,
    required this.maitri,
    required this.gan,
    required this.bhakut,
    required this.nadi,
    required this.total,
    required this.conclusion,
  });

  factory _CompatibilityResponseData.fromJson(Map<String, dynamic> json) {
    return _CompatibilityResponseData(
      varna: _CompatibilityDetails.fromJson(json['varna']),
      vashya: _CompatibilityDetails.fromJson(json['vashya']),
      tara: _CompatibilityDetails.fromJson(json['tara']),
      yoni: _CompatibilityDetails.fromJson(json['yoni']),
      maitri: _CompatibilityDetails.fromJson(json['maitri']),
      gan: _CompatibilityDetails.fromJson(json['gan']),
      bhakut: _CompatibilityDetails.fromJson(json['bhakut']),
      nadi: _CompatibilityDetails.fromJson(json['nadi']),
      total: json['total']['total_points'],
      conclusion: json['conclusion'],
    );
  }

  Map<String, String> toMap() {
    return {
      varna.description: varna.report,
      vashya.description: vashya.report,
      tara.description: tara.report,
      yoni.description: yoni.report,
      maitri.description: maitri.report,
      gan.description: gan.report,
      bhakut.description: bhakut.report,
      nadi.description: nadi.report,
    };
  }
}

class _CompatibilityDetails {
  final String description;
  final String male_koot_attribute;
  final String female_koot_attribute;
  final num recieved_points;
  final num total_points;
  final String report;

  _CompatibilityDetails({
    required this.description,
    required this.male_koot_attribute,
    required this.female_koot_attribute,
    required this.recieved_points,
    required this.total_points,
    required this.report,
  });

  factory _CompatibilityDetails.fromJson(Map<String, dynamic> json) {
    return _CompatibilityDetails(
      description: json['description'],
      male_koot_attribute: json['male_koot_attribute'],
      female_koot_attribute: json['female_koot_attribute'],
      recieved_points: json['received_points'],
      total_points: json['total_points'],
      report: json['report']['report'].first,
    );
  }
}
