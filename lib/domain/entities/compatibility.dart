import 'package:horoskope/domain/entities/zodiac_signs.dart';

class Compatibility {
  final int id;
  final String userName;
  final ZodiacSign userZodiacSign;
  final String partnerName;
  final ZodiacSign partnerZodiacSign;
  final int romanticCompatibilityRate;
  final int frienshipCompatibilityRate;
  final Map<String, String> romanticCompatibilityItems;
  final Map<String, String> friendshipCompatibilityItems;

  const Compatibility({
    required this.id,
    required this.userName,
    required this.userZodiacSign,
    required this.partnerName,
    required this.partnerZodiacSign,
    required this.romanticCompatibilityRate,
    required this.frienshipCompatibilityRate,
    required this.romanticCompatibilityItems,
    required this.friendshipCompatibilityItems,
  });
}
