import 'package:horoskope/domain/entities/zodiac_signs.dart';

class UserData {
  final int id;
  final String name;
  final ZodiacSign zodiacSign;

  UserData({
    required this.id,
    required this.name,
    required this.zodiacSign,
  });
}