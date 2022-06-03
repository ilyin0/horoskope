import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/short_compatibility.dart';

abstract class CompatibilityRepository {
  Future<List<ShortCompatibility>> getAllShortCompatibilities(int userId);
  Future<Compatibility?> getDetailedCompatibility({
    required int compatibilityId,
  });
}
