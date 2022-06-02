import 'package:horoskope/domain/entities/zodiac_sign.dart';

class CompatibilityPerson {
  final String name;
  final ZodiacSign zodiacSign;

  const CompatibilityPerson({
    required this.name,
    required this.zodiacSign,
  });
}
