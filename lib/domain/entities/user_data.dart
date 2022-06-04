import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horoskope/domain/entities/gender.dart';
import 'package:horoskope/domain/entities/geo.dart';
import 'package:horoskope/domain/entities/zodiac_sign.dart';

class UserData {
  final String id;
  final String name;
  final DateTime birthDateTime;
  final Geo birthPlace;
  final Gender gender;

  const UserData({
    required this.id,
    required this.name,
    required this.birthDateTime,
    required this.birthPlace,
    required this.gender,
  });

  UserData.empty({
    required this.id,
  })  : name = '',
        birthDateTime = DateTime.fromMillisecondsSinceEpoch(0),
        birthPlace = const Geo.zero(),
        gender = Gender.male;

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        birthDateTime: (json['birth_date_time'] as Timestamp).toDate(),
        birthPlace: Geo(
          latitude: json['birth_latitude'],
          longitude: json['birth_longitude'],
        ),
        gender: genderFromString(json['gender'] ?? 'male'));
  }

  factory UserData.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return UserData.fromJson(snapshot.data() ?? {});
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'birth_date_time': birthDateTime,
      'birth_latitude': birthPlace.latitude,
      'birth_longitude': birthPlace.longitude,
      'gender': gender.name,
    };
  }

  ZodiacSign get zodiacSign => zodiacSignFromBirthDate(birthDateTime);
}
