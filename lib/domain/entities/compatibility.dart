import 'package:horoskope/domain/entities/zodiac_signs.dart';

class Compatibility {
  final String name;
  final int romanticCompatibility;
  final int friendshipCompatibility;
  final ZodiacSign partnerZodiacSign;
  final Map<String, String> romanticCompatibilityItems;
  final Map<String, String> friendshipCompatibilityItems;
  final String? shortDescription;

  Compatibility({
    required this.name,
    required this.romanticCompatibility,
    required this.friendshipCompatibility,
    required this.partnerZodiacSign,
    this.romanticCompatibilityItems = const {},
    this.friendshipCompatibilityItems = const {},
    this.shortDescription,
  });
}
