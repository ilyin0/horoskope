import 'package:horoskope/domain/entities/compatibility.dart';
import 'package:horoskope/domain/entities/short_compatibility.dart';
import 'package:horoskope/domain/repositories/compatibility_repository.dart';
import 'package:horoskope/domain/repositories/user_data_repository.dart';

class FakeCompatibilityRepository implements CompatibilityRepository {
  final UserDataRepository _userDataRepository;

  const FakeCompatibilityRepository(this._userDataRepository);

  @override
  Future<List<ShortCompatibility>> getAllShortCompatibilities() {
    return Future.delayed(
      const Duration(seconds: 3),
      () => const [
        ShortCompatibility(
          id: 1,
          name: 'Alice',
          romanticCompatibility: 98,
        ),
        ShortCompatibility(
          id: 1,
          name: 'Kirstin',
          shortDescription: 'A twin flame',
          romanticCompatibility: 91,
        ),
        ShortCompatibility(
          id: 1,
          name: 'Ann',
          shortDescription: 'A perfect match',
          romanticCompatibility: 99,
        ),
      ],
    );
  }

  @override
  Future<Compatibility?> getDetailedCompatibility({
    required String friendId,
  }) async {
    final userData = await _userDataRepository.getUserData();

    if (userData == null) return null;

    return const Compatibility(
      romanticCompatibilityRate: 99,
      friendshipCompatibilityRate: 93,
      romanticCompatibilityItems: {
        'Basic Identities':
            'Detailed romantic compatibility data are temporaritly unavailable. We\'re currently working on this. Stay connected!',
        'Emotional Styles':
            'Detailed romantic compatibility data are temporaritly unavailable. We\'re currently working on this. Stay connected!'
      },
      friendshipCompatibilityItems: {
        'Basic Identities':
            'Detailed friendship compatibility data are temporaritly unavailable. We\'re currently working on this. Stay connected!',
        'Emotional Styles':
            'Detailed friendship compatibility data are temporaritly unavailable. We\'re currently working on this. Stay connected!',
      },
    );
  }
}
