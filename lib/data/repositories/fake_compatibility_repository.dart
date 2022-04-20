import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';

class FakeCompatibilityRepository implements CompatibilityRepository {
  @override
  Future<List<Compatibility>> getAllCompatibilities(int userId) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => [
        Compatibility(
          name: 'Alice',
          romanticCompatibility: 98,
          friendshipCompatibility: 55,
          compatibilityItems: {},
        ),
        Compatibility(
          name: 'Kirstin',
          shortDescription: 'A twin flame',
          romanticCompatibility: 91,
          friendshipCompatibility: 67,
          compatibilityItems: {},
        ),
      ],
    );
  }
}
