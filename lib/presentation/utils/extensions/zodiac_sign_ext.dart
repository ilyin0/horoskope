import 'package:horoskope/domain/entities/zodiac_sign.dart';
import 'package:horoskope/presentation/resources/app_images_asset.dart';

extension SodiacSignExt on ZodiacSign {
  String get imagePath {
    switch (this) {
      case ZodiacSign.aquarius:
        return AppImagesAsset.aquarius;
      case ZodiacSign.aries:
        return AppImagesAsset.aries;
      case ZodiacSign.cancer:
        return AppImagesAsset.cancer;
      case ZodiacSign.capricorn:
        return AppImagesAsset.capricorn;
      case ZodiacSign.gemini:
        return AppImagesAsset.gemini;
      case ZodiacSign.leo:
        return AppImagesAsset.leo;
      case ZodiacSign.libra:
        return AppImagesAsset.libra;
      case ZodiacSign.pisces:
        return AppImagesAsset.pisces;
      case ZodiacSign.sagittarius:
        return AppImagesAsset.sagittarius;
      case ZodiacSign.scorpio:
        return AppImagesAsset.scorpio;
      case ZodiacSign.taurus:
        return AppImagesAsset.scorpio;
      case ZodiacSign.virgo:
        return AppImagesAsset.virgo;
    }
  }
}
