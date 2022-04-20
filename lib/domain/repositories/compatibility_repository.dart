import 'package:horoskope/domain/entities/compatibility.dart';

abstract class CompatibilityRepository {
  Future<List<Compatibility>> getAllCompatibilities(int userId);
}
